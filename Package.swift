// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrameworkAWrapper",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FrameworkAWrapper",
            targets: ["FrameworkATarget"]),
    ],
    dependencies: [
        .package(name: "FrameworkB", url: "git@github.com:abid-opn/FrameworkB.git", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "FrameworkADependencies", dependencies: [
            "FrameworkB"
        ]),
        .binaryTarget(name: "FrameworkA", path: "artifacts/FrameworkA.xcframework"),
        .target(name: "FrameworkATarget", dependencies: [
            .target(name: "FrameworkA", condition: .when(platforms: [.iOS])),
            .target(name: "FrameworkADependencies", condition: .when(platforms: [.iOS]))
        ])
    ]
)
