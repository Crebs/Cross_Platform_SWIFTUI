// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Adwaita Template",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/AparokshaUI/Adwaita", from: "0.2.0"),
        .package(url: "https://github.com/AparokshaUI/Localized", from: "0.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "AdwaitaTemplate",
            dependencies: [
                .product(name: "Adwaita", package: "Adwaita"),
                .product(name: "Localized", package: "Localized"),
            ],
            path: "Sources",
            sources: ["Models", "Views", "ViewModels", "AdwaitaTemplate.swift"],
            resources: [
                .process("DemoPayload.json")
            ],
            plugins: [
                .plugin(name: "GenerateLocalized", package: "Localized")
            ]
        ),
        // .systemLibrary(
        //     name: "cWebkit2gtk",
        //     pkgConfig: "webkit2gtk-4.0",
        //     providers: [
        //         .apt(["libwebkit2gtk-4.0-dev"]),
        //     ]
        // ),
        // .systemLibrary(
        //     name: "cJavaScriptCore",
        //     pkgConfig: "webkit2gtk-4.0",
        //     providers: [
        //         .apt(["libwebkit2gtk-4.0-dev"]),
        //     ]
        // ),
        // .target(
        //     name: "cWebview",
        //     dependencies: [
        //         .target(
        //             name: "cWebkit2gtk",
        //             condition: .when(
        //                 platforms: [.linux]
        //             )
        //         ),
        //         .target(
        //             name: "cJavaScriptCore",
        //             condition: .when(
        //                 platforms: [.linux]
        //             )
        //         ),
        //     ],
        //     path: "Sources/cWebview",
        //     cSettings: [
        //         .headerSearchPath("usr/include/webkitgtk-4.0"),
        //         .headerSearchPath("usr/include/webkitgtk-4.0/JavaScriptCore")
        //     ],
        //     linkerSettings: [
        //         .linkedFramework(
        //             "WebKit",
        //             .when(platforms: [.macOS])
        //         ),
        //         .linkedLibrary(
        //             "webkit2gtk-4.0", 
        //             .when(
        //                 platforms: [.linux]
        //             )
        //         ),
        //         .linkedLibrary(
        //             "javascriptcoregtk-4.0", 
        //             .when(
        //                 platforms: [.linux]
        //             )
        //         )
        //     ]
        // )
    ]
)
