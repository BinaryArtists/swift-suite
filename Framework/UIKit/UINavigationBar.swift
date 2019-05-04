//  Github地址：https://github.com/wangrui460/WRNavigationBar_swift
//  实现了以下功能：
//  0. 常规定制
//  1. 上下滑动，导航栏渐入渐出
//  2. 导航栏设置背景图片
//  3. 导航栏设置渐变背景色
//  4. 上下滑动，导航栏收缩弹出

import Foundation
import UIKit

// MARK: - UINavigationBar extension

/// This extesion adds some useful functions to UINavigationBar.
public extension UINavigationBar {
    // MARK: - Functions
    
    /// Set the UINavigationBar to transparent or not.
    ///
    /// - Parameters:
    ///   - transparent: Set to true if trasparent, otherwise false.
    ///   - translucent: A Boolean value indicating whether the navigation bar is translucent or not.
    func setTransparent(_ transparent: Bool, translucent: Bool = true) {
        if transparent {
            self.setBackgroundImage(UIImage(), for: .default)
            self.shadowImage = UIImage()
            self.isTranslucent = translucent
        } else {
            self.setBackgroundImage(nil, for: .default)
            self.shadowImage = nil
            self.isTranslucent = translucent
        }
    }
}
