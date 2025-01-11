// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BitcoinCore",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "BitcoinCore",
            targets: ["BitcoinCore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Brightify/Cuckoo.git", .upToNextMajor(from: "1.5.0")),
        .package(url: "https://github.com/groue/GRDB.swift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "5.0.1")),

        .package(url: "https://github.com/just-software-dev/Checkpoints.git", branch: "master"),
        .package(url: "https://github.com/just-software-dev/HdWalletKit.Swift.git", branch: "main"),
        .package(url: "https://github.com/just-software-dev/HsCryptoKit.Swift.git", branch: "main"),
        .package(url: "https://github.com/just-software-dev/HsExtensions.Swift.git", branch: "main"),
        .package(url: "https://github.com/just-software-dev/HsToolKit.Swift.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "BitcoinCore",
            dependencies: [
                "BigInt",
                "Checkpoints",
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "HdWalletKit", package: "HdWalletKit.Swift"),
                .product(name: "HsCryptoKit", package: "HsCryptoKit.Swift"),
                .product(name: "HsExtensions", package: "HsExtensions.Swift"),
                .product(name: "HsToolKit", package: "HsToolKit.Swift"),
            ]
        ),
        .testTarget(
            name: "BitcoinCoreTests",
            dependencies: [
                "BitcoinCore",
                "Cuckoo",
                "Nimble",
                "Quick",
            ]
        ),
    ]
)
