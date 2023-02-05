import SwiftUI

struct ContentView: View {
    @State var name: String = "John"
    
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                
            Button(action: {
                self.name = "Mary"
            }) {
                Text("Change name")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
