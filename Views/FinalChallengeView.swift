import SwiftUI
import AppKit

struct FinalChallengeView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Final Boss Challenge 🏆")
                        .font(.largeTitle.bold())
                    Text("Week 8 capstone: Coin Collector with sound, 3 coins, and a timer.")
                        .foregroundStyle(.secondary)
                }

                ProgressView(
                    value: Double(appState.finalChallengeChecks.count),
                    total: Double(appState.finalRequirements.count)
                )
                .tint(.orange)
                Text("\(appState.finalChallengeChecks.count) / \(appState.finalRequirements.count) requirements checked")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                ForEach(appState.finalRequirements) { req in
                    Card(
                        title: req.title,
                        subtitle: appState.finalChallengeChecks.contains(req.id) ? "Done!" : "Required",
                        accent: appState.finalChallengeChecks.contains(req.id) ? .green : .orange
                    ) {
                        Text(req.detail)
                        Text("Hint: \(req.hint)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        CodeBlockView(code: req.starterSnippet) {
                            NSPasteboard.general.clearContents()
                            NSPasteboard.general.setString(req.starterSnippet, forType: .string)
                        }
                        Toggle("I've added this to my game", isOn: Binding(
                            get: { appState.finalChallengeChecks.contains(req.id) },
                            set: { _ in appState.toggleFinalCheck(req.id) }
                        ))
                    }
                }

                if let finalGame = appState.games.last {
                    Card(title: "Full starter game", subtitle: finalGame.title, accent: .purple) {
                        NavigationLink {
                            GameDetailView(game: finalGame)
                        } label: {
                            Label("Open Coin Collector project", systemImage: "gamecontroller.fill")
                        }
                        NavigationLink {
                            PlaygroundView(
                                initialCode: finalGame.starterCode,
                                title: "Final Challenge",
                                contextKey: PlaygroundContext.game(finalGame.id),
                                scriptFilename: "final-challenge.py",
                                codeTests: finalGame.codeTests ?? []
                            )
                        } label: {
                            Label("Run in Playground", systemImage: "terminal")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }

                Card(title: "Graduation checklist", accent: .blue) {
                    VStack(alignment: .leading, spacing: 6) {
                        checklistRow("All 8 weeks of lessons complete", appState.progressFraction >= 0.95)
                        checklistRow("At least 4 games built", appState.completedGames.count >= 4)
                        checklistRow("Final challenge: sound", appState.finalChallengeChecks.contains("fc-sound"))
                        checklistRow("Final challenge: 3 coins", appState.finalChallengeChecks.contains("fc-coins"))
                        checklistRow("Final challenge: timer", appState.finalChallengeChecks.contains("fc-timer"))
                    }
                }
            }
            .padding(24)
        }
        .coachPageBackground()
        .navigationTitle("Final Boss")
    }

    private func checklistRow(_ text: String, _ done: Bool) -> some View {
        HStack {
            Image(systemName: done ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(done ? .green : .secondary)
            Text(text)
        }
    }
}
