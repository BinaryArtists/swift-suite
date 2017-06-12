# tool.swift

Data driven!

- [ReactorKit/ReactorKit](https://github.com/ReactorKit/ReactorKit)

## We need !!!

1. carthage
    
```
```

2. cocospod

```
```

3. package manager??

## partition

## architect (clean ios architecture)

1. View
2. Between View and ViewController
2. ViewController
3. Between ViewController and Interactor
3. Interactor

1. Scene / per view
    - Configurator (singleton)
    
    - ViewController <PresenterOutput>
    - ViewController.output -> Interactor (输出Action)
    - ViewController.router -> Router
    
    - Router <RouterInput>
    - Router -> ViewController, dataSource:Interactor, dataDestination:Interactor
    
    - Interactor <ViewControllerOutput, RouterDataSource, RouterDataDestination>
    - Interactor.output -> Presenter (输出裸数据)
    
    - Presenter <tInteractorOutput>
    - Presenter.output -> ViewController (输出ViewModel)


结论：我不喜欢这种，过于碎片，不简洁

## architect (react)



## script


----
1. We are not trying to output anything from the ViewController.
2. We are assuming the output === Interactor and the architecture loses sense (no component should know about what kind of object its output/input is).
3. We dont want the ViewController to know anythyng about Business model.
4. We want the Interactor to handle this data but we don't want the ViewController to know anything about it.

## manual

0. [vsouza/awesome-ios](https://github.com/vsouza/awesome-ios)

1. Magic '_': 
    - [Swift——(三)Swift神奇的下划线](http://www.cnblogs.com/bhlsheji/p/4746072.html)
2. Variable
    - [Swift中的let和var背后的编程模式](http://www.open-open.com/news/view/eb9089)
    - [Swift if let / var 连用语法与guard let语法介绍](http://www.jianshu.com/p/2d5bcff1a696)

## tools

1. [JohnSundell/SwiftPlate](https://github.com/JohnSundell/SwiftPlate)
2. [yonaskolb/SwagGen](https://github.com/yonaskolb/SwagGen), Swagger/OpenAPISpec code generator written in Swift
3. 

## vendor

1. [mac-cain13/R.swift](https://github.com/mac-cain13/R.swift), resource
2. [typelift/Swiftx](https://github.com/typelift/Swiftx), Functional data types and functions
3. [skyfe79/SwiftImageProcessing](https://github.com/skyfe79/SwiftImageProcessing)
4. [jeantimex/ios-swift-collapsible-table-section](https://github.com/jeantimex/ios-swift-collapsible-table-section)
5. [keitaoouchi/IoniconsKit](https://github.com/keitaoouchi/IoniconsKit), Use ionicons as UIImage / UIFont

## projects

1. [hilen/TSWeChat](https://github.com/hilen/TSWeChat)
2. [thinkloki/swift-open-project](https://github.com/thinkloki/swift-open-project), Swift 开源项目分类汇总
3. [twostraws/HackingWithSwift](https://github.com/twostraws/HackingWithSwift)
4. [allenwong/30DaysofSwift](https://github.com/allenwong/30DaysofSwift)
5. [larrynatalicio/15DaysofAnimationsinSwift](https://github.com/larrynatalicio/15DaysofAnimationsinSwift)

## reference

1. [pepibumur/Startup](https://github.com/pepibumur/Startup)
2. [github/swift-style-guide](https://github.com/github/swift-style-guide), [Artwalk/swift-style-guide](https://github.com/Artwalk/swift-style-guide/blob/master/README_CN.md)
3. [apple/swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation)
4. [fulldecent/swift3-module-template](https://github.com/fulldecent/swift3-module-template)
5. [mcudich/TemplateKit](https://github.com/mcudich/TemplateKit)
6. [HelmMobile/clean-swift-templates](https://github.com/HelmMobile/clean-swift-templates), [icylydia/SwiftSingleton](https://github.com/icylydia/SwiftSingleton)