# swift-suite
---

* 包管理：Cocopods
* 核心依赖
    - [ReactorKit/ReactorKit](https://github.com/ReactorKit/ReactorKit)

## 分层
---

* Framework/Foundation
    - 基础扩展 Extension
* Framework/UIKit
    - UI扩展 Extension
* Framework/Core
    - 工具组件 Tools
        + 缓存
        + 网络层
        + 数据库
        + debug: 调试工具
* Framework/Module
    - 业务服务 Service
        + service: 核心服务组件
    - 业务组件 Biz Component
        + component: UI widget, UI 单一组件，UI 业务组件
* Framework/Component
    - Appearance: 外观工具
    - Base: 基础类集
    - Component: 组件包装层(避免第三方库命名、规则，污染到业务层)
    - Core: 核心工具包装层

## 其他工具
---

* [Cocopods](https://www.jianshu.com/p/36953a48937d)

```
pod lib create WYLib


pod lib lint

$ git remote add origin http://git.weiyankeji.cn/APP/ios/WYLib.git
$ git add .
$ git commit -m "Initial commit"
$ git push -u origin master
//tag 值要和podspec中的version一致
$ git tag 0.1.0
//推送tag到服务器上
$ git push --tags


pod spec lint
```

## architect (clean ios architecture)
---

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

1. We are not trying to output anything from the ViewController.
2. We are assuming the output === Interactor and the architecture loses sense (no component should know about what kind of object its output/input is).
3. We dont want the ViewController to know anythyng about Business model.
4. We want the Interactor to handle this data but we don't want the ViewController to know anything about it.

## 说明
---

0. [vsouza/awesome-ios](https://github.com/vsouza/awesome-ios)

1. Magic '_': 
    - [Swift——(三)Swift神奇的下划线](http://www.cnblogs.com/bhlsheji/p/4746072.html)
2. Variable
    - [Swift中的let和var背后的编程模式](http://www.open-open.com/news/view/eb9089)
    - [Swift if let / var 连用语法与guard let语法介绍](http://www.jianshu.com/p/2d5bcff1a696)
3. open，public，internal，fileprivate，private

## vendor
---

1. [mac-cain13/R.swift](https://github.com/mac-cain13/R.swift), resource
2. [typelift/Swiftx](https://github.com/typelift/Swiftx), Functional data types and functions
3. [skyfe79/SwiftImageProcessing](https://github.com/skyfe79/SwiftImageProcessing)
4. [jeantimex/ios-swift-collapsible-table-section](https://github.com/jeantimex/ios-swift-collapsible-table-section)
5. [keitaoouchi/IoniconsKit](https://github.com/keitaoouchi/IoniconsKit), Use ionicons as UIImage / UIFont
6. [JohnSundell/SwiftPlate](https://github.com/JohnSundell/SwiftPlate)
7. [yonaskolb/SwagGen](https://github.com/yonaskolb/SwagGen), Swagger/OpenAPISpec code generator written in Swift

1. [hilen/TSWeChat](https://github.com/hilen/TSWeChat)
2. [thinkloki/swift-open-project](https://github.com/thinkloki/swift-open-project), Swift 开源项目分类汇总
3. [twostraws/HackingWithSwift](https://github.com/twostraws/HackingWithSwift)
4. [allenwong/30DaysofSwift](https://github.com/allenwong/30DaysofSwift)
5. [larrynatalicio/15DaysofAnimationsinSwift](https://github.com/larrynatalicio/15DaysofAnimationsinSwift)

1. [pepibumur/Startup](https://github.com/pepibumur/Startup)
2. [github/swift-style-guide](https://github.com/github/swift-style-guide), [Artwalk/swift-style-guide](https://github.com/Artwalk/swift-style-guide/blob/master/README_CN.md)
3. [apple/swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation)
4. [fulldecent/swift3-module-template](https://github.com/fulldecent/swift3-module-template)
5. [mcudich/TemplateKit](https://github.com/mcudich/TemplateKit)
6. [HelmMobile/clean-swift-templates](https://github.com/HelmMobile/clean-swift-templates), [icylydia/SwiftSingleton](https://github.com/icylydia/SwiftSingleton)


## 未整理
---

// MARK: - TableView

// 1. [jeantimex/ios-swift-collapsible-table-section](https://github.com/jeantimex/ios-swift-collapsible-table-section), 可伸缩tableview
// 2. [SwipeCellKit/SwipeCellKit](https://github.com/SwipeCellKit/SwipeCellKit)
// 3. [Yalantis/PullToRefresh](https://github.com/Yalantis/PullToRefresh)
// 4. [bcylin/QuickTableViewController](https://github.com/bcylin/QuickTableViewController)
// 5. [i-schuetz/tableview_infinite](https://github.com/i-schuetz/tableview_infinite), 无限上啦

// MARK: - 数据架构

// 1. [ole/SortedArray](https://github.com/ole/SortedArray)
// 2. [lorentey/BTree](https://github.com/lorentey/BTree)
// 3. https://github.com/objcio/OptimizingCollections
// 4. https://github.com/evgenyneu/SigmaSwiftStatistics
// 5. https://github.com/LlamaKit/LlamaKit
// 6. https://github.com/natecook1000/SortedCollection
// 7. https://github.com/IntrepidPursuits/swift-wisdom

// MARK: - Collection

// 1. https://github.com/giulio92/GLTableCollectionView
// 2. https://github.com/Ramotion/gliding-collection, 这个用于 分类+列表, pod 'GlidingCollection'
// 3. https://github.com/roberthein/BouncyLayout, 这个弹性可以使用：pod "BouncyLayout"
// 4. ruslanskorb/RSKCollectionViewRetractableFirstItemLayout, 拖动搜索
// 5. https://github.com/KelvinJin/AnimatedCollectionViewLayout, 几乎是全屏，切换，动画
// 6. https://github.com/ElegantTeam/ETCollectionViewWaterFallLayout
// 7. https://github.com/vinnyoodles/mosaic-layout


// MARK: - Switcher

// 1. https://github.com/TBXark/TKSwitcherCollection

// MARK: - 加密

// 1. https://github.com/krzyzanowskim/CryptoSwift


// MARK: - 动画

// 1. https://github.com/YouXianMing/Swift-Animations


// MARK: - _System struct

/// This class adds some useful functions for the App.

struct _Core {
    // MARK: - Variables
    
    /// Used to store the HasBeenOpened in defaults.
    private static let AppHasBeenOpened = "BFAppHasBeenOpened"
    
    // MARK: - Functions
    
    /// Executes a block only if in DEBUG mode.
    ///
    /// [Usage](http://stackoverflow.com/questions/26890537/disabling-nslog-for-production-in-swift-project/26891797#26891797).
    public static func debug(_ block: () -> Void) {
        #if DEBUG
            block()
        #endif
    }
    
    /// Executes a block only if NOT in DEBUG mode.
    public static func release(_ block: () -> Void) {
        #if !DEBUG
            block()
        #endif
    }
    
    /// If version is set returns if is first start for that version,
    /// otherwise returns if is first start of the App.
    ///
    /// - Parameter version: Version to be checked, you can use the variable BFApp.version to pass the current App version.
    /// - Returns: Returns if is first start of the App or for custom version.
    public static func isFirstStart(version: String = "") -> Bool {
        let key: String = AppHasBeenOpened + "\(version)"
        
        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)
        
        return !hasBeenOpened
    }
    
    /// Executes a block on first start of the App, if version is set it will be for given version.
    ///
    /// Remember to execute UI instuctions on main thread.
    ///
    /// - Parameters:
    ///   - version: Version to be checked, you can use the variable BFApp.version to pass the current App version.
    ///   - block: The block to execute, returns isFirstStart.
    public static func onFirstStart(version: String = "", block: (_ isFirstStart: Bool) -> Void) {
        let key: String
        if version == "" {
            key = AppHasBeenOpened
        } else {
            key = AppHasBeenOpened + "\(version)"
        }
        
        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)
        if hasBeenOpened != true {
            defaults.set(true, forKey: key)
        }
        
        block(!hasBeenOpened)
    }
    
    /// Set the App setting for a given object and key. The file will be saved in the Library directory.
    ///
    /// - Parameters:
    ///   - object: Object to set.
    ///   - objectKey: Key to set the object.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    @discardableResult
    public static func setAppSetting(object: Any, forKey objectKey: String) -> Bool {
        return FileManager.default.setSettings(filename: _Core.name, object: object, forKey: objectKey)
    }
    
    /// Get the App setting for a given key.
    ///
    /// - Parameter objectKey: Key to get the object.
    /// - Returns: Returns the object for the given key.
    public static func getAppSetting(objectKey: String) -> Any? {
        return FileManager.default.getSettings(filename: _Core.name, forKey: objectKey)
    }
}

// MARK: - BFApp extension

/// Extends BFApp with project infos.
extension _Core {
    // MARK: - Variables
    
    /// Return the App name.
    public static var name: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleDisplayName")
    }()
    
    /// Returns the App version.
    public static var version: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleShortVersionString")
    }()
    
    /// Returns the App build.
    public static var build: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleVersion")
    }()
    
    /// Returns the App executable.
    public static var executable: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleExecutable")
    }()
    
    /// Returns the App bundle.
    public static var bundle: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleIdentifier")
    }()
    
    // MARK: - Functions
    
    /// Returns a String from the Info dictionary of the App.
    ///
    /// - Parameter key: Key to search.
    /// - Returns: Returns a String from the Info dictionary of the App.
    private static func stringFromInfoDictionary(forKey key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary, let value = infoDictionary[key] as? String else {
            return ""
        }
        
        return value
    }
}


