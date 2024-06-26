// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Journey",
    platforms: [.iOS(.v12), .macCatalyst(.v13), .tvOS(.v12), .macOS(.v12), .visionOS(.v1)],
    products: [
        .library(name: "Journey", targets: ["Journey"]),
        .library(name: "JourneyInterface", targets: ["JourneyInterface"]),
    ],
    dependencies: [
        .package(url: "https://github.com/DataDog/dd-sdk-ios.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "Journey",
            dependencies: [
                .product(name: "DatadogCore", package: "dd-sdk-ios"),
                .product(name: "DatadogLogs", package: "dd-sdk-ios"),
                "JourneyInterface",
            ]
        ),
        .target(name: "JourneyInterface"),
        .testTarget(name: "JourneyTests", dependencies: ["Journey", "JourneyInterface"]),
    ]
)
