import SwiftUI

struct StackedExampleView: View {

    @State private var position: Int?
    @State private var composition: String = ""
    @FocusState private var compositionFocused: Bool
    @State private var bottomMargin: CGFloat = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    ForEach(1..<100) { value in
                        Text(value.formatted())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .id(value)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $position, anchor: .bottom)
            .border(.red, width: 2.0)
            .padding(.bottom, bottomMargin)

            TextField(
                "",
                text: $composition,
                prompt: Text("Enter some text…"),
                axis: .vertical
            )
            .textFieldStyle(.roundedBorder)
            .lineLimit(5)
            .focused($compositionFocused)
            .padding()
            .background(
                GeometryReader { geometry in
                    Color.green.opacity(0.3)
                        .onChange(of: geometry.size) { _, newValue in
                            bottomMargin = newValue.height
                        }
                        .onAppear {
                            bottomMargin = geometry.size.height
                        }
                }
            )

            VStack(alignment: .leading) {
                Text("Scroll Debugging")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Position: \(position ?? -1)")
                Text("Bottom Margin: \(bottomMargin)")
            }
            .padding()
            .background(.yellow.opacity(0.3))
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .onChange(of: compositionFocused) { _, newValue in
            scrollToBottom()
        }
        .onChange(of: composition) { _, newValue in
            scrollToBottom()
        }
        .onChange(of: bottomMargin) { _, newValue in
            scrollToBottom()
        }
    }

    private func scrollToBottom() {
        withAnimation {
            position = 99
        }
    }
}


#Preview {
    StackedExampleView()
}
