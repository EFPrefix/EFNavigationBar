// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "EFNavigationBar",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "EFNavigationBar", targets: ["EFNavigationBar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/EFPrefix/EFFoundation.git", .upToNextMinor(from: "1.7.0"))
    ],
    targets: [
        .target(name: "EFNavigationBar", dependencies: ["EFFoundation"], path: "EFNavigationBar"),
    ]
)
