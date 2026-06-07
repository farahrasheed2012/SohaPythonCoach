import SwiftUI

@main
struct SohaPythonCoachApp: App {
    @State private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
                .frame(minWidth: 900, minHeight: 650)
        }
        .defaultSize(width: 1024, height: 760)
    }
}
