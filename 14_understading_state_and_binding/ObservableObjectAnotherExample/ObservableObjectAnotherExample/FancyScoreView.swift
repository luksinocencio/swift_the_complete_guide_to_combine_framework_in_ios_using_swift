import SwiftUI

struct FancyScoreView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
            Button(action: {
                self.userSettings.score += 1
            }) {
                Text("Increment Score")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            }
            .padding()
            .background(Color.green)
        }
        .padding()
        .background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
    }
}
