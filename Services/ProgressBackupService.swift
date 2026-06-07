import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct ProgressBackup: Codable {
    static let currentVersion = 1

    var version: Int
    var exportedAt: Date
    var studentName: String
    var completedLessons: [String]
    var completedGames: [String]
    var finalChallengeChecks: [String]
    var weekNotes: [String: String]
    var stuckItems: [String]
    var playgroundCode: [String: String]
    var selectedWeekID: Int
}

struct ProgressBackupDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.json] }

    var data: Data

    init(data: Data) {
        self.data = data
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.data = data
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: data)
    }
}

enum ProgressBackupService {
    static func defaultFilename() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return "soha-python-progress-\(formatter.string(from: Date())).json"
    }

    @MainActor
    static func makeBackup(from appState: AppState) -> ProgressBackup {
        ProgressBackup(
            version: ProgressBackup.currentVersion,
            exportedAt: Date(),
            studentName: appState.studentName,
            completedLessons: Array(appState.completedLessons),
            completedGames: Array(appState.completedGames),
            finalChallengeChecks: Array(appState.finalChallengeChecks),
            weekNotes: appState.weekNotes,
            stuckItems: Array(appState.stuckItems),
            playgroundCode: appState.playgroundCode,
            selectedWeekID: appState.selectedWeekID
        )
    }

    static func encode(_ backup: ProgressBackup) throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(backup)
    }

    static func decode(_ data: Data) throws -> ProgressBackup {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(ProgressBackup.self, from: data)
    }

    @MainActor
    static func apply(_ backup: ProgressBackup, to appState: AppState) {
        appState.studentName = backup.studentName
        appState.completedLessons = Set(backup.completedLessons)
        appState.completedGames = Set(backup.completedGames)
        appState.finalChallengeChecks = Set(backup.finalChallengeChecks)
        appState.weekNotes = backup.weekNotes
        appState.stuckItems = Set(backup.stuckItems)
        appState.playgroundCode = backup.playgroundCode
        appState.selectedWeekID = backup.selectedWeekID
        appState.save()
    }

    static func summary(for backup: ProgressBackup) -> String {
        "\(backup.completedLessons.count) lessons · \(backup.completedGames.count) games · \(backup.finalChallengeChecks.count)/3 final checks"
    }
}
