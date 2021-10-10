// swift-tools-version:5.5

import PackageDescription


let package = Package(
    name: "Buoy",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "Buoy",
            targets: ["Buoy"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.5.0")),
        .package(url: "https://github.com/Apodini/ApodiniIoTDeploymentProvider", .branch("develop")),
        .package(url: "https://github.com/hendesi/buoy-deployment-provider.git", .branch("develop"))
    ],
    targets: [
        .executableTarget(
            name: "Buoy",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniHTTP", package: "Apodini"),
                .product(name: "ApodiniDeploy", package: "Apodini"),
                .product(name: "DeploymentTargetIoTRuntime", package: "ApodiniIoTDeploymentProvider"),
                .product(name: "BuoyDeploymentOption", package: "buoy-deployment-provider")
            ]
        ),
        .testTarget(
            name: "BuoyTests",
            dependencies: [
                .target(name: "Buoy")
            ]
        )
    ]
)
