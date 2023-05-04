// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DNIECMS",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(
            name: "DNIECMS",
            targets: ["DNIECMS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-asn1.git", branch: "main"),
        .package(path: "../swift-certificates")
    ],
    targets: [
        .target(
            name: "DNIECMS",
            dependencies: [
                .product(name: "X509", package: "swift-certificates"),
                .product(name: "SwiftASN1", package: "swift-asn1")
            ]
        ),
        .testTarget(
            name: "DNIECMSTests",
            dependencies: ["DNIECMS"]),
    ]
)
