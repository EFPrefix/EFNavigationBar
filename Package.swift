// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "EFNavigationBar",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(name: "EFNavigationBar", targets: ["EFNavigationBar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/EFPrefix/EFFoundation.git", .upToNextMinor(from: "1.4.11")),
        .package(url: "https://github.com/devicekit/DeviceKit.git", .upToNextMinor(from: "4.4.0"))
    ],
    targets: [
        .target(name: "EFNavigationBar", dependencies: ["DeviceKit", "EFFoundation"], path: "EFNavigationBar"),
    ]
)
