import SwiftUI

struct ContentView: View {
    @Binding var name: String
    
    var body: some View {
        Text("Hello, \(name)").padding()
    }
}
