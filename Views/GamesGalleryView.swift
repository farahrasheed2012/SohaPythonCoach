import SwiftUI
import AppKit

struct GamesGalleryView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Build 5 Games")
                    .font(.largeTitle.bold())
                Text("Text games first, then pygame for the final coin collector.")
                    .foregroundStyle(.secondary)

                ForEach(appState.games) { game in
                    NavigationLink(value: game) {
                        GameRow(game: game, isComplete: appState.completedGames.contains(game.id))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(24)
        }
        .coachPageBackground()
        .navigationTitle("Games")
    }
}

private struct GameRow: View {
    let game: GameProject
    let isComplete: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Text("\(game.weekNumber)")
                .font(.title2.bold().monospacedDigit())
                .frame(width: 36, height: 36)
                .background(Color.purple.opacity(0.15))
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(game.title)
                        .font(.headline)
                    if isComplete {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundStyle(.green)
                    }
                }
                Text(game.summary)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.tertiary)
        }
        .padding(16)
        .background(Color(nsColor: .controlBackgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct GameDetailView: View {
    @Environment(AppState.self) private var appState
    let game: GameProject

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Card(title: game.title, subtitle: "Week \(game.weekNumber) project", accent: .purple) {
                    Text(game.summary)
                    FlowLayout(spacing: 6) {
                        ForEach(game.skills, id: \.self) { SkillPill(text: $0) }
                    }
                }

                Card(title: "Steps", accent: .blue) {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(Array(game.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 8) {
                                Text("\(index + 1).")
                                    .font(.caption.bold().monospacedDigit())
                                    .foregroundStyle(.secondary)
                                Text(step)
                            }
                        }
                    }
                }

                Card(title: "Starter code", accent: .green) {
                    CodeBlockView(code: game.starterCode) {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(game.starterCode, forType: .string)
                    }
                    NavigationLink {
                        PlaygroundView(
                            initialCode: game.starterCode,
                            title: game.title,
                            contextKey: PlaygroundContext.game(game.id),
                            starterFingerprint: PlaygroundContext.starterFingerprint(starter: game.starterCode),
                            scriptFilename: "\(game.id).py",
                            codeTests: game.codeTests ?? []
                        )
                        .id(game.id)
                    } label: {
                        Label("Run in Playground", systemImage: "play.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    if !game.codeTests.isNilOrEmpty {
                        Text("\(game.codeTests?.count ?? 0) auto-checks available in Playground")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                if let stretch = game.stretchGoal {
                    Card(title: "Stretch goal", accent: .orange) {
                        Text(stretch)
                    }
                }

                Button {
                    appState.toggleGame(game.id)
                } label: {
                    Label(
                        appState.completedGames.contains(game.id) ? "Mark not done" : "Mark game complete",
                        systemImage: "flag.checkered"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
            .padding(24)
        }
        .coachPageBackground()
        .navigationTitle(game.title)
    }
}

private extension Optional where Wrapped == [CodeTest] {
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
}
