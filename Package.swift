//
// Copyright (c) 2022-present MoneySwap OU (mercuryo.io)
//

import PackageDescription

let package = Package(
    name: "Mercuryo-Widget",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "Mercuryo-Widget",
            targets: ["Mercuryo-Widget"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Mercuryo-Widget",
            dependencies: []),
        .testTarget(
            name: "Mercuryo-WidgetTests",
            dependencies: ["Mercuryo-Widget"]),
    ],
    swiftLanguageVersions: [.v5]
)
