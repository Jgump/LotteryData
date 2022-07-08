// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LotteryData",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        //产品定义了一个包生成的可执行文件和库，并使它们对其他包可见。
        .library(name: "LotteryData",targets: ["LotteryData"]),
    ],
    dependencies: [ //依赖项声明此包所依赖的其他包。
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        //目标 是包的基本构建块。目标可以定义模块或测试套件。
        //目标 可以依赖于此包中的其他目标，也可以依赖于此包所依赖的包中的产品。
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .target(name: "LotteryData",resources: [.process("Plists/")]),
//            .process("2003.plist"),.process("2004.plist"),.process("2005.plist"),
//            .process("2006.plist"),.process("2007.plist"),.process("2008.plist"),
//            .process("2009.plist"),.process("2010.plist"),.process("2011.plist"),
//            .process("2012.plist"),.process("2013.plist"),.process("2014.plist"),
//            .process("2015.plist"),.process("2016.plist"),.process("2017.plist"),
//            .process("2018.plist"),.process("2019.plist"),.process("2020.plist"),
//            .process("2021.plist"),.process("2022.plist")
//
//        ]),
       
        .testTarget(name: "LotteryDataTests",dependencies: ["LotteryData"]),
    ]
)
