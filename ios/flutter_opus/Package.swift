// swift-tools-version: 5.9
// The Swift Package Manager manifest for the Flutter iOS plugin.

import PackageDescription

let package = Package(
    name: "flutter_opus",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            // Flutter normalizes underscores in plugin product names to
            // hyphens when generating FlutterGeneratedPluginSwiftPackage.
            name: "flutter-opus",
            targets: ["flutter_opus"]
        )
    ],
    dependencies: [
        // Flutter generates this local package for SPM-enabled applications.
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
