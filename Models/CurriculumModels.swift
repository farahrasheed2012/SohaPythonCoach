import Foundation

struct CodeTest: Identifiable, Hashable, Codable {
    let id: String
    let label: String
    /// Python run after the student's code in the same file. Should `raise AssertionError` on failure.
    let assertionScript: String
    /// When false, inspects source without executing student code (for input()/pygame scripts).
    let inspectSourceOnly: Bool

    init(
        id: String,
        label: String,
        assertionScript: String,
        inspectSourceOnly: Bool = false
    ) {
        self.id = id
        self.label = label
        self.assertionScript = assertionScript
        self.inspectSourceOnly = inspectSourceOnly
    }
}

enum LessonFormat: String, Codable, Hashable {
    case selfPaced
    /// Legacy value from when sessions pointed at Outschool; treated as self-paced.
    case liveOnline
}

struct LessonStep: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let body: String
    let teacherScript: String
    let tryItPrompt: String?
    /// Ordered “do this” steps shown to the student (build, predict, run, change).
    let practiceSteps: [String]?
    let starterCode: String?
    let challengeQuestion: String?
    /// Primary accepted answer (revealed as a hint after two wrong tries).
    let challengeAnswer: String?
    /// Additional acceptable answers (case-insensitive, substring match).
    let challengeAcceptedAnswers: [String]?
    /// Optional auto-graded Python checks (run in Playground).
    let codeTests: [CodeTest]?
    let format: LessonFormat
    let durationMinutes: Int?

    init(
        id: String,
        title: String,
        body: String,
        teacherScript: String,
        tryItPrompt: String? = nil,
        practiceSteps: [String]? = nil,
        starterCode: String? = nil,
        challengeQuestion: String? = nil,
        challengeAnswer: String? = nil,
        challengeAcceptedAnswers: [String]? = nil,
        codeTests: [CodeTest]? = nil,
        format: LessonFormat = .selfPaced,
        durationMinutes: Int? = nil
    ) {
        self.id = id
        self.title = title
        self.body = body
        self.teacherScript = teacherScript
        self.tryItPrompt = tryItPrompt
        self.practiceSteps = practiceSteps
        self.starterCode = starterCode
        self.challengeQuestion = challengeQuestion
        self.challengeAnswer = challengeAnswer
        self.challengeAcceptedAnswers = challengeAcceptedAnswers
        self.codeTests = codeTests
        self.format = format
        self.durationMinutes = durationMinutes
    }

    var isLiveLesson: Bool { false }

    var allAcceptedAnswers: [String] {
        var answers: [String] = []
        if let challengeAnswer, !challengeAnswer.isEmpty {
            answers.append(challengeAnswer)
        }
        if let challengeAcceptedAnswers {
            answers.append(contentsOf: challengeAcceptedAnswers)
        }
        return answers
    }

    var requiresCodeTests: Bool {
        guard let codeTests, !codeTests.isEmpty else { return false }
        return true
    }
}

struct WeekUnit: Identifiable, Hashable, Codable {
    let id: Int
    let title: String
    let subtitle: String
    let emoji: String
    let goal: String
    let skills: [String]
    let lessons: [LessonStep]
}

struct GameProject: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let weekNumber: Int
    let summary: String
    let skills: [String]
    let steps: [String]
    let starterCode: String
    let stretchGoal: String?
    let codeTests: [CodeTest]?

    init(
        id: String,
        title: String,
        weekNumber: Int,
        summary: String,
        skills: [String],
        steps: [String],
        starterCode: String,
        stretchGoal: String? = nil,
        codeTests: [CodeTest]? = nil
    ) {
        self.id = id
        self.title = title
        self.weekNumber = weekNumber
        self.summary = summary
        self.skills = skills
        self.steps = steps
        self.starterCode = starterCode
        self.stretchGoal = stretchGoal
        self.codeTests = codeTests
    }
}

struct FinalChallengeRequirement: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let detail: String
    let hint: String
    let starterSnippet: String
}

struct OutcomeGoal: Identifiable, Hashable {
    let id: String
    let title: String
    let detail: String
}

enum PlaygroundContext {
    static func lesson(_ id: String) -> String { "lesson:\(id)" }
    static func game(_ id: String) -> String { "game:\(id)" }
    static let playground = "playground:main"

    /// Prepends lesson prompt + quick-check as a Doxygen-style docstring above starter code.
    static func lessonPlaygroundCode(
        starter: String?,
        lessonTitle: String?,
        lessonBody: String?,
        challengeQuestion: String?
    ) -> String {
        let body = starter?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let docstring = lessonDocstringBlock(
            lessonTitle: lessonTitle,
            lessonBody: lessonBody,
            challengeQuestion: challengeQuestion
        )
        let header = docstring.map { $0 + "\n\n" } ?? ""

        if body.isEmpty {
            if header.isEmpty {
                return "print(\"Hello, Soha!\")"
            }
            return header + "# Try your answer here:\n"
        }
        return header + (starter ?? body)
    }

    /// Docstring-only prefix for merging into saved Playground code.
    static func lessonCommentHeader(
        lessonTitle: String?,
        lessonBody: String?,
        challengeQuestion: String?
    ) -> String {
        guard let docstring = lessonDocstringBlock(
            lessonTitle: lessonTitle,
            lessonBody: lessonBody,
            challengeQuestion: challengeQuestion
        ) else { return "" }
        return docstring + "\n\n"
    }

    /// Leading docstring or legacy `#` comment block before executable code.
    static func commentHeaderPrefix(in code: String) -> String? {
        if let docstring = docstringHeaderPrefix(in: code) {
            return docstring
        }
        return hashCommentHeaderPrefix(in: code)
    }

    /// If saved Playground code is missing the lesson docstring, prepend or replace a legacy `#` header.
    static func mergeLessonCommentHeader(into saved: String, header: String) -> String {
        guard !header.isEmpty else { return saved }
        if saved.hasPrefix(header) { return saved }
        if saved.contains("@question") { return saved }

        if let existing = commentHeaderPrefix(in: saved), !existing.isEmpty {
            let remainder = saved.dropFirst(existing.count)
            return header + remainder
        }
        return header + saved
    }

    private static func lessonDocstringBlock(
        lessonTitle: String?,
        lessonBody: String?,
        challengeQuestion: String?
    ) -> String? {
        var lines: [String] = []

        if let title = lessonTitle?.trimmingCharacters(in: .whitespacesAndNewlines), !title.isEmpty {
            lines.append("@title \(title)")
            lines.append("")
        }
        if let lessonText = lessonBody?.trimmingCharacters(in: .whitespacesAndNewlines), !lessonText.isEmpty {
            lines.append(contentsOf: LessonTextFormatting.plainText(from: lessonText)
                .split(separator: "\n", omittingEmptySubsequences: false)
                .map(String.init))
            lines.append("")
        }
        if let question = challengeQuestion?.trimmingCharacters(in: .whitespacesAndNewlines), !question.isEmpty {
            lines.append("@question \(question)")
        }

        while lines.last == "" {
            lines.removeLast()
        }
        guard !lines.isEmpty else { return nil }

        return "\"\"\"\n" + lines.joined(separator: "\n") + "\n\"\"\""
    }

    private static func docstringHeaderPrefix(in code: String) -> String? {
        guard code.hasPrefix("\"\"\"") else { return nil }
        let searchStart = code.index(code.startIndex, offsetBy: 3)
        guard searchStart < code.endIndex,
              let close = code.range(of: "\"\"\"", range: searchStart..<code.endIndex) else {
            return nil
        }

        var end = close.upperBound
        while end < code.endIndex, code[end].isNewline {
            end = code.index(after: end)
        }
        var prefix = String(code[..<end])
        if end < code.endIndex {
            prefix += "\n"
        }
        return prefix
    }

    private static func hashCommentHeaderPrefix(in code: String) -> String? {
        var lines: [String] = []
        var seenComment = false
        for line in code.split(separator: "\n", omittingEmptySubsequences: false) {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed.isEmpty {
                if seenComment {
                    lines.append("")
                    return lines.joined(separator: "\n") + "\n"
                }
                continue
            }
            if trimmed.hasPrefix("#") {
                seenComment = true
                lines.append(String(line))
            } else if seenComment {
                return lines.joined(separator: "\n") + "\n"
            } else {
                return nil
            }
        }
        return seenComment ? lines.joined(separator: "\n") + "\n" : nil
    }

    /// Stable hash of the lesson scaffold — used to discard stale Playground autosaves when starters change.
    static func starterFingerprint(starter: String?) -> String {
        let normalized = (starter ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalized.isEmpty else { return "empty" }
        var hash: UInt64 = 5381
        for byte in normalized.utf8 {
            hash = ((hash << 5) &+ hash) &+ UInt64(byte)
        }
        return String(hash, radix: 16)
    }
}

enum AppTab: String, CaseIterable, Identifiable {
    case journey, games, challenge, playground, progress

    var id: String { rawValue }

    var label: String {
        switch self {
        case .journey: "Journey"
        case .games: "Games"
        case .challenge: "Final Boss"
        case .playground: "Playground"
        case .progress: "Progress"
        }
    }

    var systemImage: String {
        switch self {
        case .journey: "map.fill"
        case .games: "gamecontroller.fill"
        case .challenge: "flag.checkered"
        case .playground: "terminal.fill"
        case .progress: "chart.bar.fill"
        }
    }
}
