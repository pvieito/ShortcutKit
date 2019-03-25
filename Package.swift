// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "ShortcutKit",
    products: [
        .executable(
            name: "ShortcutTool",
            targets: ["ShortcutTool"]
        ),
        .library(
            name: "ShortcutKit",
            targets: ["ShortcutKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pvieito/CommandLineKit.git", .branch("master")),
        .package(url: "https://github.com/pvieito/LoggerKit.git", .branch("master")),
        .package(url: "https://github.com/pvieito/FoundationKit.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "ShortcutTool",
            dependencies: ["LoggerKit", "CommandLineKit", "FoundationKit", "ShortcutKit"],
            path: "ShortcutTool"
        ),
        .target(
            name: "ShortcutKit",
            dependencies: ["FoundationKit"],
            path: "ShortcutKit"
        ),
    ]
)
