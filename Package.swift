// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HandyJSONSupport",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "HandyJSONSupport",
            targets: ["HandyJSONSupport"]),
        .library(
            name: "RxHandyJSONSupport",
            targets: ["RxHandyJSONSupport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/zevwings/HTTPKit.git", from: "0.0.3"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),
        .package(url: "https://github.com/alibaba/HandyJSON.git", from: "5.0.1")
    ],
    targets: [
        .target(
            name: "HandyJSONSupport",
            dependencies: ["HTTPKit", "HandyJSON"],
            path: "HandyJSONSupport"),
        .target(
            name: "RxHandyJSONSupport",
            dependencies: ["HandyJSONSupport", "RxSwift"],
            path: "RxHandyJSONSupport"),
    ],
    swiftLanguageVersions: [.v5]
)
