import Adwaita

struct ListView: View {
    let app: GTUIApp
    let viewModel: ContentViewModel

    @State private var selectedItemId: String? = nil

    var view: Body {
        List(viewModel.contents) { content in
            Text(content.title)
            .padding()
            .onClick {
                self.selectedItemId = content.id
                // ContentView().createWebView()
            }
            .popover(visible: self.shouldShowPopover(for: content.id)) {
                Text("Popover content: \(content.html)")
                    .padding()
            }
        }
    }

    private func shouldShowPopover(for itemId: String) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.selectedItemId == itemId },
            set: { _ in self.selectedItemId = nil } // Reset when the popover is dismissed
        )
    }
}
