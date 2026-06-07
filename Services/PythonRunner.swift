import Foundation
import AppKit

enum PythonRunner {
    enum LaunchError: LocalizedError {
        case message(String)

        var errorDescription: String? {
            switch self {
            case .message(let text): text
            }
        }
    }

    static func findPython() -> String? {
        let candidates = ["/usr/bin/python3", "/opt/homebrew/bin/python3", "/usr/local/bin/python3"]
        for path in candidates where FileManager.default.isExecutableFile(atPath: path) {
            return path
        }
        return nil
    }

    static var scriptsDirectory: URL {
        let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("SohaPythonCoach/scripts", isDirectory: true)
        try? FileManager.default.createDirectory(at: base, withIntermediateDirectories: true)
        return base
    }

    static func containsPygame(_ code: String) -> Bool {
        code.lowercased().contains("import pygame") || code.lowercased().contains("from pygame")
    }

    /// Scripts that need a real window, server, or blocking GUI — use Terminal or Run game window.
    static func needsTerminalLaunch(_ code: String) -> Bool {
        let lower = code.lowercased()
        if containsPygame(code) { return true }
        if lower.contains("import tkinter") || lower.contains("from tkinter") { return true }
        if lower.contains("from flask") || lower.contains("import flask") { return true }
        if lower.contains("matplotlib") || lower.contains("plt.show") { return true }
        if lower.contains("root.mainloop") { return true }
        if lower.contains("app.run") { return true }
        return false
    }

    @discardableResult
    static func saveScript(named filename: String, code: String) throws -> URL {
        let safe = filename.replacingOccurrences(of: " ", with: "-")
        let url = scriptsDirectory.appendingPathComponent(safe.hasSuffix(".py") ? safe : "\(safe).py")
        try code.write(to: url, atomically: true, encoding: .utf8)
        return url
    }

    static func openInTerminal(scriptURL: URL) {
        let dir = scriptURL.deletingLastPathComponent().path
            .replacingOccurrences(of: "'", with: "'\\''")
        let file = scriptURL.path
            .replacingOccurrences(of: "'", with: "'\\''")
        let shellCommand = "cd '\(dir)' && python3 '\(file)'"
        let escaped = shellCommand.replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"", with: "\\\"")
        let source = """
        tell application "Terminal"
            activate
            do script "\(escaped)"
        end tell
        """
        var error: NSDictionary?
        NSAppleScript(source: source)?.executeAndReturnError(&error)
    }

    /// Launch pygame (or any GUI script) in a detached python process.
    static func launchWindowedScript(code: String, suggestedName: String) -> Result<URL, LaunchError> {
        guard findPython() != nil else {
            return .failure(.message("Python 3 not found."))
        }
        do {
            let url = try saveScript(named: suggestedName, code: code)
            let process = Process()
            process.executableURL = URL(fileURLWithPath: findPython()!)
            process.arguments = [url.path]
            process.standardOutput = FileHandle.nullDevice
            process.standardError = FileHandle.nullDevice
            try process.run()
            return .success(url)
        } catch {
            return .failure(.message(error.localizedDescription))
        }
    }

    static func run(code: String, timeout: TimeInterval = 8) async -> RunResult {
        await runFileContents(code, timeout: timeout)
    }

    static func runWithTests(userCode: String, tests: [CodeTest], timeout: TimeInterval = 10) async -> [TestRunResult] {
        var results: [TestRunResult] = []
        for test in tests {
            let combined: String
            if test.inspectSourceOnly {
                let escaped = userCode
                    .replacingOccurrences(of: "\\", with: "\\\\")
                    .replacingOccurrences(of: "\"", with: "\\\"")
                    .replacingOccurrences(of: "\n", with: "\\n")
                combined = """
                user_code = "\(escaped)"
                # --- static check: \(test.label) ---
                \(test.assertionScript)
                """
            } else {
                combined = """
                \(userCode)

                # --- auto-check: \(test.label) ---
                \(test.assertionScript)
                """
            }
            let result = await runFileContents(combined, timeout: timeout)
            let passed = result.exitCode == 0 && (result.error == nil || result.error?.isEmpty == true)
            results.append(TestRunResult(
                test: test,
                passed: passed,
                output: result.output,
                error: result.error
            ))
        }
        return results
    }

    struct RunResult {
        let output: String
        let error: String?
        let exitCode: Int32
    }

    struct TestRunResult {
        let test: CodeTest
        let passed: Bool
        let output: String
        let error: String?
    }

    private static func runFileContents(_ code: String, timeout: TimeInterval) async -> RunResult {
        guard let python = findPython() else {
            return RunResult(
                output: "",
                error: "Python 3 not found. Run: xcode-select --install",
                exitCode: -1
            )
        }

        let tempURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("soha-python-\(UUID().uuidString).py")

        do {
            try code.write(to: tempURL, atomically: true, encoding: .utf8)
        } catch {
            return RunResult(output: "", error: error.localizedDescription, exitCode: -1)
        }

        defer { try? FileManager.default.removeItem(at: tempURL) }

        return await withCheckedContinuation { continuation in
            let process = Process()
            process.executableURL = URL(fileURLWithPath: python)
            process.arguments = [tempURL.path]

            let outPipe = Pipe()
            let errPipe = Pipe()
            process.standardOutput = outPipe
            process.standardError = errPipe

            var finished = false
            let lock = NSLock()

            let timer = DispatchSource.makeTimerSource(queue: .global())
            timer.schedule(deadline: .now() + timeout)
            timer.setEventHandler {
                lock.lock()
                defer { lock.unlock() }
                guard !finished else { return }
                finished = true
                process.terminate()
                continuation.resume(returning: RunResult(output: "", error: "Timed out after \(Int(timeout))s.", exitCode: -1))
            }
            timer.resume()

            process.terminationHandler = { proc in
                lock.lock()
                defer { lock.unlock() }
                guard !finished else { return }
                finished = true
                timer.cancel()

                let stdout = String(data: outPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
                let stderr = String(data: errPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
                continuation.resume(returning: RunResult(
                    output: stdout,
                    error: stderr.isEmpty ? nil : stderr,
                    exitCode: proc.terminationStatus
                ))
            }

            do {
                try process.run()
            } catch {
                lock.lock()
                defer { lock.unlock() }
                guard !finished else { return }
                finished = true
                timer.cancel()
                continuation.resume(returning: RunResult(output: "", error: error.localizedDescription, exitCode: -1))
            }
        }
    }
}
