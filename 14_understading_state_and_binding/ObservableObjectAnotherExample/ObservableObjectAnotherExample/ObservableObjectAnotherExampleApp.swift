import SwiftUI

@main
struct ObservableObjectAnotherExampleApp: App {
    
    let userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userSettings)
        }
    }
}
