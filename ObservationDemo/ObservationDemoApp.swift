import SwiftUI

@main
struct ObservationDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ViewModel())
        }
    }
}
