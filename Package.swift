// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Journey",
    platforms: [.iOS(.v11), .macCatalyst(.v13), .tvOS(.v11)],
    products: [
        .library(name: "Journey", targets: ["Journey"]),
        .library(name: "JourneyInterface", targets: ["JourneyInterface"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/DataDog/dd-sdk-ios.git",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "Journey",
            dependencies: [
                .product(name: "Datadog", package: "dd-sdk-ios"),
                "JourneyInterface"
            ]
        ),
        .target(name: "JourneyInterface"),
        .testTarget(name: "JourneyTests", dependencies: ["Journey", "JourneyInterface"])
    ]
)
