//
//  _TabBarController.swift
//
//  Created by Vincent Li on 2017/2/8.
//  Copyright (c) 2013-2017 _TabBarController (https://github.com/eggswift/_TabBarController)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

/// 是否需要自定义点击事件回调类型
public typealias _TabBarControllerShouldHijackHandler = ((_ tabBarController: UITabBarController, _ viewController: UIViewController, _ index: Int) -> (Bool))
/// 自定义点击事件回调类型
public typealias _TabBarControllerDidHijackHandler = ((_ tabBarController: UITabBarController, _ viewController: UIViewController, _ index: Int) -> (Void))

open class _TabBarController: UITabBarController, _TabBarDelegate {
    
    /// 打印异常
    open static func printError(_ description: String) {
        #if DEBUG
            print("ERROR: _TabBarController catch an error '\(description)' \n")
        #endif
    }
    
    /// 当前tabBarController是否存在"More"tab
    open static func isShowingMore(_ tabBarController: UITabBarController?) -> Bool {
        return tabBarController?.moreNavigationController.parent != nil
    }

    /// Ignore next selection or not.
    fileprivate var ignoreNextSelection = false

    /// Should hijack select action or not.
    open var shouldHijackHandler: _TabBarControllerShouldHijackHandler?
    /// Hijack select action.
    open var didHijackHandler: _TabBarControllerDidHijackHandler?
    
    /// Observer tabBarController's selectedViewController. change its selection when it will-set.
    open override var selectedViewController: UIViewController? {
        willSet {
            guard let newValue = newValue else {
                // if newValue == nil ...
                return
            }
            guard !ignoreNextSelection else {
                ignoreNextSelection = false
                return
            }
            guard let tabBar = self.tabBar as? _TabBar, let items = tabBar.items, let index = viewControllers?.index(of: newValue) else {
                return
            }
            let value = (_TabBarController.isShowingMore(self) && index > items.count - 1) ? items.count - 1 : index
            tabBar.select(itemAtIndex: value, animated: false)
        }
    }
    
    /// Observer tabBarController's selectedIndex. change its selection when it will-set.
    open override var selectedIndex: Int {
        willSet {
            guard !ignoreNextSelection else {
                ignoreNextSelection = false
                return
            }
            guard let tabBar = self.tabBar as? _TabBar, let items = tabBar.items else {
                return
            }
            let value = (_TabBarController.isShowingMore(self) && newValue > items.count - 1) ? items.count - 1 : newValue
            tabBar.select(itemAtIndex: value, animated: false)
        }
    }
    
    /// Customize set tabBar use KVC.
    open override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = { () -> _TabBar in 
            let tabBar = _TabBar()
            tabBar.delegate = self
            tabBar.customDelegate = self
            tabBar.tabBarController = self
            return tabBar
        }()
        self.setValue(tabBar, forKey: "tabBar")
    }

    // MARK: - UITabBar delegate
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.index(of: item) else {
            return;
        }
        if idx == tabBar.items!.count - 1, _TabBarController.isShowingMore(self) {
            ignoreNextSelection = true
            selectedViewController = moreNavigationController
            return;
        }
        if let vc = viewControllers?[idx] {
            ignoreNextSelection = true
            selectedIndex = idx
            delegate?.tabBarController?(self, didSelect: vc)
        }
    }
    
    open override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        if let tabBar = tabBar as? _TabBar {
            tabBar.updateLayout()
        }
    }
    
    open override func tabBar(_ tabBar: UITabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) {
        if let tabBar = tabBar as? _TabBar {
            tabBar.updateLayout()
        }
    }
    
    // MARK: - _TabBar delegate
    internal func tabBar(_ tabBar: UITabBar, shouldSelect item: UITabBarItem) -> Bool {
        if let idx = tabBar.items?.index(of: item), let vc = viewControllers?[idx] {
            return delegate?.tabBarController?(self, shouldSelect: vc) ?? true
        }
        return true
    }
    
    internal func tabBar(_ tabBar: UITabBar, shouldHijack item: UITabBarItem) -> Bool {
        if let idx = tabBar.items?.index(of: item), let vc = viewControllers?[idx] {
            return shouldHijackHandler?(self, vc, idx) ?? false
        }
        return false
    }
    
    internal func tabBar(_ tabBar: UITabBar, didHijack item: UITabBarItem) {
        if let idx = tabBar.items?.index(of: item), let vc = viewControllers?[idx] {
            didHijackHandler?(self, vc, idx)
        }
    }
    
}
