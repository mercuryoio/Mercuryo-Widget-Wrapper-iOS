//
// Copyright (c) 2022-present MoneySwap OU (mercuryo.io)
//

import PackageDescription

let package = Package(
    name: "MRCRWidget",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "MRCRWidget",
            targets: ["MRCRWidget"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MRCRWidget",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v5]
)
