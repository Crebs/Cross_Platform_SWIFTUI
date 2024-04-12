// The Swift Programming Language
// https://docs.swift.org/swift-book

import Adwaita
class NavigationAppState {
    var path = NavigationView()
}

@main
struct AdwaitaTemplate: App {

    let id = "io.github.AparokshaUI.AdwaitaTemplate"
    let state = NavigationAppState()
    var contentViewModel = ContentViewModel()
    var app: GTUIApp!

    var scene: Scene {
        Window(id: "main") { window in
           ListView(app: app, viewModel: contentViewModel)
           .padding()
           .topToolbar {
              ToolbarView(app: app, window: window)
           }
        }
        .defaultSize(width: 450, height: 300)
    }
}
