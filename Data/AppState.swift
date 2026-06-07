import Foundation
import Observation

@Observable
final class AppState {
    var completedLessons: Set<String> = []
    var completedGames: Set<String> = []
    var finalChallengeChecks: Set<String> = []
    var weekNotes: [String: String] = [:]
    var stuckItems: Set<String> = []
    var playgroundCode: [String: String] = [:]
    var selectedWeekID: Int = 1
    var studentName: String = "Soha"
    private var progressSchemaVersion: Int = 2

    private let storageKey = "SohaPythonCoach.progress.v2"

    init() {
        load()
    }

    var weeks: [WeekUnit] { CurriculumSeed.weeks }
    var games: [GameProject] { CurriculumSeed.games }
    var finalRequirements: [FinalChallengeRequirement] { CurriculumSeed.finalChallenge }
    var outcomes: [OutcomeGoal] { CurriculumSeed.outcomes }

    var totalLessons: Int {
        weeks.reduce(0) { $0 + $1.lessons.count }
    }

    var completedLessonCount: Int { completedLessons.count }

    var progressFraction: Double {
        guard totalLessons > 0 else { return 0 }
        return Double(completedLessonCount) / Double(totalLessons)
    }

    func isLessonComplete(_ id: String) -> Bool {
        completedLessons.contains(id)
    }

    func isStuck(_ id: String) -> Bool {
        stuckItems.contains(id)
    }

    func toggleStuck(_ id: String) {
        if stuckItems.contains(id) {
            stuckItems.remove(id)
        } else {
            stuckItems.insert(id)
        }
        save()
    }

    func code(for contextKey: String, default defaultCode: String) -> String {
        playgroundCode[contextKey] ?? defaultCode
    }

    func saveCode(_ code: String, for contextKey: String) {
        playgroundCode[contextKey] = code
        save()
    }

    func weekNote(for weekID: Int) -> String {
        weekNotes[String(weekID)] ?? ""
    }

    func setWeekNote(_ text: String, for weekID: Int) {
        weekNotes[String(weekID)] = text
        save()
    }

    func toggleLesson(_ id: String) {
        if completedLessons.contains(id) {
            completedLessons.remove(id)
        } else {
            completedLessons.insert(id)
        }
        save()
    }

    func toggleGame(_ id: String) {
        if completedGames.contains(id) {
            completedGames.remove(id)
        } else {
            completedGames.insert(id)
        }
        save()
    }

    func toggleFinalCheck(_ id: String) {
        if finalChallengeChecks.contains(id) {
            finalChallengeChecks.remove(id)
        } else {
            finalChallengeChecks.insert(id)
        }
        save()
    }

    func weekProgress(_ week: WeekUnit) -> Double {
        let done = week.lessons.filter { completedLessons.contains($0.id) }.count
        guard !week.lessons.isEmpty else { return 0 }
        return Double(done) / Double(week.lessons.count)
    }

    func save() {
        let payload = StoredProgress(
            completedLessons: Array(completedLessons),
            completedGames: Array(completedGames),
            finalChallengeChecks: Array(finalChallengeChecks),
            weekNotes: weekNotes,
            stuckItems: Array(stuckItems),
            playgroundCode: playgroundCode,
            selectedWeekID: selectedWeekID,
            studentName: studentName,
            schemaVersion: progressSchemaVersion
        )
        if let data = try? JSONEncoder().encode(payload) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let payload = try? JSONDecoder().decode(StoredProgress.self, from: data) {
            apply(payload)
            migrateWeekOrderIfNeeded()
            return
        }
        // Migrate v1
        if let data = UserDefaults.standard.data(forKey: "SohaPythonCoach.progress.v1"),
           let legacy = try? JSONDecoder().decode(LegacyStoredProgress.self, from: data) {
            completedLessons = Set(legacy.completedLessons)
            completedGames = Set(legacy.completedGames)
            finalChallengeChecks = Set(legacy.finalChallengeChecks)
            weekNotes = legacy.notes
            selectedWeekID = legacy.selectedWeekID
            studentName = legacy.studentName.isEmpty ? "Soha" : legacy.studentName
            save()
            migrateWeekOrderIfNeeded()
        }
    }

    /// Remap lesson IDs after Level 3 insert (40-week → 50-week order). Runs once.
    private func migrateWeekOrderIfNeeded() {
        guard progressSchemaVersion < 2 else { return }

        var remappedLessons = Set<String>()
        for id in completedLessons {
            remappedLessons.insert(Self.remappedLessonID(id) ?? id)
        }
        completedLessons = remappedLessons

        var remappedCode: [String: String] = [:]
        for (key, value) in playgroundCode {
            let newKey = Self.remappedLessonID(key) ?? key
            if remappedCode[newKey] == nil {
                remappedCode[newKey] = value
            }
        }
        playgroundCode = remappedCode

        progressSchemaVersion = 2
        save()
    }

    private static func remappedLessonID(_ id: String) -> String? {
        guard id.hasSuffix("-live"), id.hasPrefix("w") else { return nil }
        let weekPart = id.dropFirst().dropLast(5)
        guard let week = Int(weekPart), (21...40).contains(week) else { return nil }
        return "w\(week + 10)-live"
    }

    private func apply(_ payload: StoredProgress) {
        completedLessons = Set(payload.completedLessons)
        completedGames = Set(payload.completedGames)
        finalChallengeChecks = Set(payload.finalChallengeChecks)
        weekNotes = payload.weekNotes
        stuckItems = Set(payload.stuckItems)
        playgroundCode = payload.playgroundCode
        selectedWeekID = payload.selectedWeekID
        studentName = payload.studentName.isEmpty ? "Soha" : payload.studentName
        progressSchemaVersion = payload.schemaVersion ?? 1
    }
}

private struct StoredProgress: Codable {
    var completedLessons: [String]
    var completedGames: [String]
    var finalChallengeChecks: [String]
    var weekNotes: [String: String]
    var stuckItems: [String]
    var playgroundCode: [String: String]
    var selectedWeekID: Int
    var studentName: String
    var schemaVersion: Int?
}

private struct LegacyStoredProgress: Codable {
    var completedLessons: [String]
    var completedGames: [String]
    var finalChallengeChecks: [String]
    var notes: [String: String]
    var selectedWeekID: Int
    var studentName: String
}
