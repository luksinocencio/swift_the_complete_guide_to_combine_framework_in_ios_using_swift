import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    
    private func printName() {
        print(self.name)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text(name)
            TextField("Enter name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: printName) {
                Text("Show name value")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
