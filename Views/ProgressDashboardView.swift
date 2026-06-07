import SwiftUI
import AppKit
import UniformTypeIdentifiers

struct ProgressDashboardView: View {
    @Environment(AppState.self) private var appState

    @State private var exportDocument = ProgressBackupDocument(data: Data())
    @State private var showExporter = false
    @State private var showImporter = false
    @State private var backupStatus: String?
    @State private var pendingImport: ProgressBackup?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Progress Dashboard")
                            .font(.largeTitle.bold())
                        Text("For \(appState.studentName) · parent view")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    ProgressRing(fraction: appState.progressFraction, label: "Overall")
                }

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    statCard("Lessons", "\(appState.completedLessonCount)/\(appState.totalLessons)", .purple)
                    statCard("Games", "\(appState.completedGames.count)/\(appState.games.count)", .blue)
                    statCard("Final Boss", "\(appState.finalChallengeChecks.count)/3", .orange)
                }

                Card(title: "Backup & restore", accent: .blue) {
                    Text("Export progress to a JSON file — open on another Mac or after reinstall.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    HStack {
                        Button("Export progress…") {
                            exportProgress()
                        }
                        Button("Import progress…") {
                            showImporter = true
                        }
                    }
                    if let backupStatus {
                        Text(backupStatus)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                if !appState.stuckItems.isEmpty {
                    Card(title: "Stuck — revisit together", accent: .orange) {
                        ForEach(stuckLessons, id: \.id) { item in
                            HStack {
                                Image(systemName: "hand.raised.fill")
                                    .foregroundStyle(.orange)
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.subheadline.weight(.semibold))
                                    Text("Week \(item.weekID)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Button("Clear") {
                                    appState.toggleStuck(item.id)
                                }
                                .controlSize(.small)
                            }
                        }
                    }
                }

                Card(title: "Week by week", accent: .purple) {
                    ForEach(appState.weeks) { week in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("Week \(week.id)")
                                    .frame(width: 60, alignment: .leading)
                                ProgressView(value: appState.weekProgress(week))
                                Text("\(Int(appState.weekProgress(week) * 100))%")
                                    .font(.caption.monospacedDigit())
                                    .frame(width: 36, alignment: .trailing)
                            }
                            if !appState.weekNote(for: week.id).isEmpty {
                                Text(appState.weekNote(for: week.id))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .padding(.leading, 60)
                            }
                        }
                    }
                }

                Card(title: "Printables", accent: .cyan) {
                    Text("Workbook for Soha · teacher script for parent. Print from Safari (⌘P).")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    HStack {
                        Button("Open student workbook") {
                            PrintableResources.open(.workbook)
                        }
                        Button("Open teacher script") {
                            PrintableResources.open(.teacherScript)
                        }
                    }
                }

                Card(title: "Skills unlocked", accent: .green) {
                    let skills = appState.weeks.flatMap(\.skills)
                    FlowLayout(spacing: 6) {
                        ForEach(Array(Set(skills)).sorted(), id: \.self) { skill in
                            SkillPill(text: skill)
                        }
                    }
                }

                Card(title: "Student name", accent: .blue) {
                    TextField("Name", text: Binding(
                        get: { appState.studentName },
                        set: {
                            appState.studentName = $0
                            appState.save()
                        }
                    ))
                    .textFieldStyle(.roundedBorder)
                }

                Card(title: "What's next after 8 weeks", accent: .cyan) {
                    VStack(alignment: .leading, spacing: 8) {
                        nextStep("Scratch", "Visual blocks — connects to loops & events she already knows")
                        nextStep("AI tools", "Prompt engineering, small automations with Python")
                        nextStep("App dev", "SwiftUI apps like Science Bowl Coach!")
                    }
                }
            }
            .padding(24)
        }
        .coachPageBackground()
        .navigationTitle("Progress")
        .fileExporter(
            isPresented: $showExporter,
            document: exportDocument,
            contentType: .json,
            defaultFilename: ProgressBackupService.defaultFilename()
        ) { result in
            switch result {
            case .success:
                backupStatus = "Progress exported."
            case .failure(let error):
                backupStatus = "Export failed: \(error.localizedDescription)"
            }
        }
        .fileImporter(
            isPresented: $showImporter,
            allowedContentTypes: [.json],
            allowsMultipleSelection: false
        ) { result in
            handleImport(result)
        }
        .alert(
            "Import progress?",
            isPresented: Binding(
                get: { pendingImport != nil },
                set: { if !$0 { pendingImport = nil } }
            ),
            presenting: pendingImport
        ) { backup in
            Button("Replace current progress", role: .destructive) {
                ProgressBackupService.apply(backup, to: appState)
                backupStatus = "Imported: \(ProgressBackupService.summary(for: backup))"
                pendingImport = nil
            }
            Button("Cancel", role: .cancel) {
                pendingImport = nil
            }
        } message: { backup in
            Text(ProgressBackupService.summary(for: backup))
        }
    }

    private var stuckLessons: [(id: String, title: String, weekID: Int)] {
        appState.weeks.flatMap { week in
            week.lessons
                .filter { appState.isStuck($0.id) }
                .map { (id: $0.id, title: $0.title, weekID: week.id) }
        }
    }

    private func exportProgress() {
        do {
            let backup = ProgressBackupService.makeBackup(from: appState)
            exportDocument = ProgressBackupDocument(data: try ProgressBackupService.encode(backup))
            showExporter = true
        } catch {
            backupStatus = "Could not prepare export: \(error.localizedDescription)"
        }
    }

    private func handleImport(_ result: Result<[URL], Error>) {
        switch result {
        case .failure(let error):
            backupStatus = "Import failed: \(error.localizedDescription)"
        case .success(let urls):
            guard let url = urls.first else { return }
            guard url.startAccessingSecurityScopedResource() else {
                backupStatus = "Could not access file."
                return
            }
            defer { url.stopAccessingSecurityScopedResource() }
            do {
                let data = try Data(contentsOf: url)
                pendingImport = try ProgressBackupService.decode(data)
            } catch {
                backupStatus = "Invalid backup file: \(error.localizedDescription)"
            }
        }
    }

    private func statCard(_ title: String, _ value: String, _ color: Color) -> some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.title.bold().monospacedDigit())
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private func nextStep(_ title: String, _ detail: String) -> some View {
        HStack(alignment: .top) {
            Text("→")
            VStack(alignment: .leading) {
                Text(title).font(.subheadline.weight(.semibold))
                Text(detail).font(.caption).foregroundStyle(.secondary)
            }
        }
    }
}
