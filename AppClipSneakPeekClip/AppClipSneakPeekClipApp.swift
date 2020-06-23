import SwiftUI

@main
struct AppClipSneakPeekClipApp: App {
    @State var name = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView(name: $name).onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: respondTo)
        }
    }
    
    func respondTo(_ activity: NSUserActivity?) {
        guard let name = firstParameterValue(from: activity) else { return }
        
        self.name = name
    }
    
    private func firstParameterValue(from activity: NSUserActivity?) -> String? {
        guard let activity = activity else { return nil }
        guard let incomingURL = activity.webpageURL else { return nil }
        guard let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else { return nil }
        
        return components.queryItems?.first?.value
    }
}
