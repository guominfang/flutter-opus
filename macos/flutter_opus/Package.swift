// swift-tools-version: 5.9
// The Swift Package Manager manifest for the Flutter macOS plugin.

import PackageDescription

let package = Package(
    name: "flutter_opus",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "flutter-opus",
            targets: ["flutter_opus"]
        )
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .binaryTarget(
            name: "Opus",
            path: "Binaries/Opus.xcframework"
        ),
        .target(
            name: "OpusFFI",
            dependencies: ["Opus"],
            publicHeadersPath: "include"
        ),
        .target(
            name: "flutter_opus",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                "OpusFFI"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
