import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fancyTime = FancyTimer()
    
    var body: some View {
        VStack {
            
            Text("\(self.fancyTime.value)")
                .font(.largeTitle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
