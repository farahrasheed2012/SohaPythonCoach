import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    @State private var tab: AppTab = .journey

    var body: some View {
        NavigationSplitView {
            List(AppTab.allCases, selection: $tab) { item in
                Label(item.label, systemImage: item.systemImage)
                    .tag(item)
            }
            .navigationTitle("Python Coach")
            .listStyle(.sidebar)
        } detail: {
            NavigationStack {
                switch tab {
                case .journey:
                    JourneyView()
                        .navigationDestination(for: WeekUnit.self) { week in
                            WeekDetailView(week: week)
                        }
                case .games:
                    GamesGalleryView()
                        .navigationDestination(for: GameProject.self) { game in
                            GameDetailView(game: game)
                        }
                case .challenge:
                    FinalChallengeView()
                case .playground:
                    PlaygroundView()
                case .progress:
                    ProgressDashboardView()
                }
            }
        }
    }
}
