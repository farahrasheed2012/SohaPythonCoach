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

struct LessonStep: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let body: String
    let teacherScript: String
    let tryItPrompt: String?
    let starterCode: String?
    let challengeQuestion: String?
    /// Primary answer (shown in hints).
    let challengeAnswer: String?
    /// Additional acceptable answers (case-insensitive, substring match).
    let challengeAcceptedAnswers: [String]?
    /// Optional auto-graded Python checks (run in Playground).
    let codeTests: [CodeTest]?

    init(
        id: String,
        title: String,
        body: String,
        teacherScript: String,
        tryItPrompt: String? = nil,
        starterCode: String? = nil,
        challengeQuestion: String? = nil,
        challengeAnswer: String? = nil,
        challengeAcceptedAnswers: [String]? = nil,
        codeTests: [CodeTest]? = nil
    ) {
        self.id = id
        self.title = title
        self.body = body
        self.teacherScript = teacherScript
        self.tryItPrompt = tryItPrompt
        self.starterCode = starterCode
        self.challengeQuestion = challengeQuestion
        self.challengeAnswer = challengeAnswer
        self.challengeAcceptedAnswers = challengeAcceptedAnswers
        self.codeTests = codeTests
    }

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
