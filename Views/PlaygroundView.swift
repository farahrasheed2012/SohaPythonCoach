import SwiftUI
import AppKit

struct PlaygroundView: View {
    @Environment(AppState.self) private var appState

    var initialCode: String = "print(\"Hello, Soha!\")"
    var title: String = "Playground"
    var contextKey: String = PlaygroundContext.playground
    var starterFingerprint: String = PlaygroundContext.starterFingerprint(starter: "print(\"Hello, Soha!\")")
    var scriptFilename: String = "soha_playground.py"
    var codeTests: [CodeTest] = []
    /// When opened from a Journey lesson, used to remember auto-check completion.
    var lessonIdForTests: String? = nil
    var practiceGuidance: String? = nil
    /// When set, prepends this block if saved Playground code lacks lesson comments.
    var lessonCommentHeader: String? = nil

    @State private var code: String = ""
    @State private var output = ""
    @State private var isRunning = false
    @State private var lastExitCode: Int32?
    @State private var testResults: [PythonRunner.TestRunResult] = []
    @State private var statusMessage: String?

    private var needsTerminal: Bool { PythonRunner.needsTerminalLaunch(code) }
    private var isPygame: Bool { PythonRunner.containsPygame(code) }

    var body: some View {
        VStack(spacing: 0) {
            if let practiceGuidance, !practiceGuidance.isEmpty {
                Text(practiceGuidance)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue.opacity(0.08))
            }
            toolbar
            HSplitView {
                editorPane
                outputPane
            }
            .padding(.bottom, 8)

            if !codeTests.isEmpty {
                testsPanel
            }

            footer
        }
        .coachPageBackground()
        .navigationTitle("Playground")
        .onAppear { reloadCode() }
        .onChange(of: contextKey) { _, _ in reloadCode() }
        .onChange(of: initialCode) { _, _ in reloadCode() }
        .onChange(of: starterFingerprint) { _, _ in reloadCode() }
        .onChange(of: code) { _, newValue in
            appState.saveCode(newValue, for: contextKey, starterFingerprint: starterFingerprint)
        }
    }

    private var toolbar: some View {
        HStack(spacing: 12) {
            Text(title)
                .font(.headline)
            if isPygame {
                Text("pygame")
                    .font(.caption2.weight(.bold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.orange.opacity(0.2))
                    .clipShape(Capsule())
            } else if needsTerminal {
                Text("run in Terminal")
                    .font(.caption2.weight(.bold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.cyan.opacity(0.2))
                    .clipShape(Capsule())
            }
            Spacer()
            Button("Reset") {
                code = initialCode
                output = ""
                testResults = []
                appState.saveCode(initialCode, for: contextKey, starterFingerprint: starterFingerprint)
            }
            if !codeTests.isEmpty {
                Button("Run tests") {
                    Task { await runTests() }
                }
                .disabled(isRunning)
            }
            if needsTerminal {
                Button {
                    launchPygame()
                } label: {
                    Label(isPygame ? "Run game window" : "Run script", systemImage: "play.rectangle")
                }
                Button {
                    openTerminal()
                } label: {
                    Label("Open in Terminal", systemImage: "terminal")
                }
            }
            Button {
                Task { await runCode() }
            } label: {
                Label(isRunning ? "Running…" : "Run", systemImage: "play.fill")
            }
            .buttonStyle(.borderedProminent)
            .disabled(isRunning)
            .keyboardShortcut("r", modifiers: .command)
        }
        .padding()
    }

    private var editorPane: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Code · auto-saved")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
                .padding(.horizontal, 12)
            PythonCodeEditor(text: $code)
                .scrollContentBackground(.hidden)
                .padding(8)
                .background(Color(nsColor: .textBackgroundColor))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 12)
        }
        .frame(minWidth: 360)
    }

    private var outputPane: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Output")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                if let lastExitCode {
                    Text("exit \(lastExitCode)")
                        .font(.caption2.monospacedDigit())
                        .foregroundStyle(lastExitCode == 0 ? .green : .orange)
                }
            }
            .padding(.horizontal, 12)
            ScrollView {
                Text(output.isEmpty ? "Press Run (⌘R). Pygame games: use Run game window or Open in Terminal." : output)
                    .font(.system(.body, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .textSelection(.enabled)
                    .padding(12)
            }
            .background(Color(nsColor: .textBackgroundColor))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 12)
        }
        .frame(minWidth: 280)
    }

    private var testsPanel: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Auto-checks")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
            if testResults.isEmpty {
                Text("Tap Run tests to verify your code.")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            } else {
                ForEach(testResults, id: \.test.id) { result in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: result.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(result.passed ? .green : .red)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(result.test.label)
                                .font(.caption.weight(.semibold))
                            if !result.passed, let err = result.error {
                                Text(err)
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(3)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }

    private var footer: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let statusMessage {
                Text(statusMessage)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            HStack {
                Image(systemName: "info.circle")
                Text("Scripts folder: ~/Library/Application Support/SohaPythonCoach/scripts/")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 12)
    }

    private func reloadCode() {
        let saved = appState.resolvedPlaygroundCode(
            contextKey: contextKey,
            initialCode: initialCode,
            starterFingerprint: starterFingerprint
        )
        if let header = lessonCommentHeader, !header.isEmpty {
            code = PlaygroundContext.mergeLessonCommentHeader(into: saved, header: header)
        } else {
            code = saved
        }
    }

    private func prepareCodeForRun() -> String {
        let prepared = PythonRunner.prepareSource(code)
        if prepared.fixedSmartQuotes {
            code = prepared.source
            statusMessage = "Curly quotes were converted to straight quotes (\") — Python needs the plain quote key."
        }
        return prepared.source
    }

    private func runCode() async {
        isRunning = true
        defer { isRunning = false }
        let runnable = prepareCodeForRun()
        if needsTerminal {
            output = "This script needs a window or server. Use Run script or Open in Terminal."
            return
        }
        let result = await PythonRunner.run(code: runnable)
        lastExitCode = result.exitCode
        if let err = result.error, !err.isEmpty {
            output = result.output + (result.output.isEmpty ? "" : "\n") + "— stderr —\n" + err
        } else {
            output = result.output.isEmpty ? "(no output)" : result.output
        }
    }

    private func runTests() async {
        isRunning = true
        defer { isRunning = false }
        let runnable = prepareCodeForRun()
        testResults = await PythonRunner.runWithTests(userCode: runnable, tests: codeTests)
        let passed = testResults.filter(\.passed).count
        output = "Tests: \(passed)/\(codeTests.count) passed."
        if let lessonIdForTests, passed == codeTests.count, !codeTests.isEmpty {
            appState.setLessonCodeTestsPassed(lessonIdForTests, passed: true)
        }
    }

    private func launchPygame() {
        let runnable = prepareCodeForRun()
        switch PythonRunner.launchWindowedScript(code: runnable, suggestedName: scriptFilename) {
        case .success(let url):
            statusMessage = "Launched \(url.lastPathComponent). Check for a pygame window."
            output = "Game process started.\n\(url.path)"
        case .failure(let err):
            statusMessage = err.localizedDescription
            output = err.localizedDescription
        }
    }

    private func openTerminal() {
        do {
            let runnable = prepareCodeForRun()
            let url = try PythonRunner.saveScript(named: scriptFilename, code: runnable)
            PythonRunner.openInTerminal(scriptURL: url)
            statusMessage = "Opened Terminal with \(url.lastPathComponent)"
            output = "Saved to:\n\(url.path)"
        } catch {
            statusMessage = error.localizedDescription
        }
    }
}
