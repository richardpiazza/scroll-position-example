import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("""
                    This project shows an example where a `ScrollView` does not **visually** maintain 
                    a scroll position as the content size of the `ScrollView` changes.
                    
                    The content size of a `ScrollView` can change for several reasons:
                    * A sibling view changes size (e.g. `TextField` expands)
                    * A `safeAreaInset` view changes size
                    * The system keyboard is shown.
                    
                    It would be great to be able to keep visual consistency, and workarounds
                    like setting the `scrollPosition` after a change has no effect (since
                    the system has not detected a scroll position change).
                    """)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)

                    NavigationLink {
                        StackedExampleView()
                    } label: {
                        Label("Stacked Example", systemImage: "square.on.square")
                    }
                    .buttonStyle(.bordered)

                    NavigationLink {
                        SafeAreaInsetExample()
                    } label: {
                        Label("Safe Area Inset Example", systemImage: "platter.filled.bottom.iphone")
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
            .navigationTitle("Example")
        }
    }
}


#Preview {
    ContentView()
}
