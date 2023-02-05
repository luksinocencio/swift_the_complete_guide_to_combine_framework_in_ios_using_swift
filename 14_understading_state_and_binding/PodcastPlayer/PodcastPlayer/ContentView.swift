import SwiftUI

struct ContentView: View {
    
    let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2019")
    @State private var isPlaying = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text(self.episode.name)
                .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            Text(self.episode.track)
                .foregroundColor(.secondary)
            PlayButton(isPlaying: $isPlaying)
        }
        .padding()
    }
}

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: self.isPlaying ? "stop.circle.fill" : "play.circle.fill" )
            Text(self.isPlaying ? "Stop" : "Play")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
