import SwiftUI

@main
struct GameControllerTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 1920 / 4,
                       maxWidth: NSScreen.main!.frame.size.width,
                       minHeight: 1080 / 4,
                       maxHeight: NSScreen.main!.frame.size.height)
        }
    }
}
