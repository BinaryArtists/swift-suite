# tool.swift

Data driven!

## partition

## architect (clean ios architecture)

1. View
2. Between View and ViewController
2. ViewController
3. Between ViewController and Interactor
3. Interactor
4. 

## script


----
1. We are not trying to output anything from the ViewController.
2. We are assuming the output === Interactor and the architecture loses sense (no component should know about what kind of object its output/input is).
3. We dont want the ViewController to know anythyng about Business model.
4. We want the Interactor to handle this data but we don't want the ViewController to know anything about it.

## manual

1. Magic '_': 
    - [Swift——(三)Swift神奇的下划线](http://www.cnblogs.com/bhlsheji/p/4746072.html)

## tools

1. [JohnSundell/SwiftPlate](https://github.com/JohnSundell/SwiftPlate)
2. [yonaskolb/SwagGen](https://github.com/yonaskolb/SwagGen), Swagger/OpenAPISpec code generator written in Swift

## projects

1. [hilen/TSWeChat](https://github.com/hilen/TSWeChat)
2. [thinkloki/swift-open-project](https://github.com/thinkloki/swift-open-project), Swift 开源项目分类汇总
3. [twostraws/HackingWithSwift](https://github.com/twostraws/HackingWithSwift)
4. [allenwong/30DaysofSwift](https://github.com/allenwong/30DaysofSwift)

## reference

1. [pepibumur/Startup](https://github.com/pepibumur/Startup)
2. [github/swift-style-guide](https://github.com/github/swift-style-guide), [Artwalk/swift-style-guide](https://github.com/Artwalk/swift-style-guide/blob/master/README_CN.md)
3. [apple/swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation)
4. [fulldecent/swift3-module-template](https://github.com/fulldecent/swift3-module-template)
5. [mcudich/TemplateKit](https://github.com/mcudich/TemplateKit)
6. [HelmMobile/clean-swift-templates](https://github.com/HelmMobile/clean-swift-templates), [icylydia/SwiftSingleton](https://github.com/icylydia/SwiftSingleton)