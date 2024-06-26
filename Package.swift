// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iDNIe",
    platforms: [
        .macOS(.v12), .iOS(.v16)
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iDNIe",
            targets: ["iDNIe"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Boilertalk/BigInt.swift.git", exact: "1.0.0"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", exact: "1.1.2300"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", exact: "1.6.0")
    ],
    targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages this package depends on.
            .binaryTarget(
                name: "iDNIe",
                path: "./Sources/iDNIe.xcframework")
        ]
)
