// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "ShortcutKit",
    products: [
        .executable(name: "ShortcutTool", targets: ["ShortcutTool"]),
        .library(name: "ShortcutKit", targets: ["ShortcutKit"]),
    ],
    dependencies: [
        .package(path: "../LoggerKit"),
        .package(path: "../CommandLineKit"),
        .package(path: "../FoundationKit"),
    ],
    targets: [
        .target(name: "ShortcutTool", dependencies: ["LoggerKit", "CommandLineKit", "FoundationKit", "ShortcutKit"], path: "ShortcutTool"),
        .target(name: "ShortcutKit", path: "ShortcutKit"),
    ]
)
