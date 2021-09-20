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
            targets: ["FrameworkA"]),
    ],
    dependencies: [
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "FrameworkA", url: "https://tmpfiles.org/dl/117484/frameworka.zip", checksum: "130a4e5e4f57f115ba6f3c56219274c22ab603a87353ec2402ae0c51367ac981")
    ]
)
