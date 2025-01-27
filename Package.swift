// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpringchatThirdParty",
    defaultLocalization: "en",
    platforms: [.iOS("13.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SpringchatThirdParty",
            targets: ["CommonObjC", "CountryPicker", "TrueTime", "Chatto", "ChattoAdditions"]),
    ],
    targets: [
        .target(
            name: "CommonObjC",
            path: "CommonObjC"
        ),
        .target(
            name: "TrueTime",
            path: "TrueTime"
        ),
        .target(
            name: "Chatto",
            path: "Chatto/Chatto"
        ),
        .target(
            name: "ChattoAdditions",
            dependencies: ["Chatto"],
            path: "Chatto/ChattoAdditions",
            resources: [
                .process("Resources"),
            ]
        ),
        .target(
            name: "CountryPicker",
            path: "CountryPicker",
            resources: [
                .process("Resources"),
                .process("CountryPicker.bundle"),                
            ]
        ),
    ]
)
