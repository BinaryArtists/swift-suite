//
//  NavigationBar.Button.swift
//  readmate
//
//  Created by 7 on 04/08/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation
import UIKit

// 严格面向功能，所以这里会有UIViewController的扩展

// MARK: - 

extension UIViewController {
    /**
     *  @brief [Left] 'title', 'target', 'selector'
     */
    func setLeftNavigationBarButton(title: String, target: Any?, action: Selector?) {
        let barButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.plain, target: self, action: action)
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
    
    /**
     *  @brief [Left] 'image', 'target', 'action'
     */
    func setLeftNavigationBarButton(imageName: String, target: Any?, action: Selector?) {
        let image = UIImage(named:imageName)
        let barButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: action)
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
    
    /**
     *  @brief [Left] 'system', 'target', 'action'
     */
    func setLeftNavigationBarButton(systemItem: UIBarButtonItem.SystemItem, target: Any?, action: Selector?) {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: target, action: action)
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
    
    /**
     *  @brief [Right] 'title', 'target', 'action'
     */
    func setRightNavigationBarButton(title: String, target: Any?, action: Selector?) {
        let barButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.plain, target: self, action: action)
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
    
    /**
     *  @brief [Right] 'image', 'target', 'action'
     */
    func setRightNavigationBarButton(imageName: String, target: Any?, action: Selector?) {
        let image = UIImage(named:imageName)
        let barButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: action)
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
    
    /**
     *  @brief [Right] 'system', 'target', 'action'
     */
    func setRightNavigationBarButton(systemItem: UIBarButtonItem.SystemItem, target: Any?, action: Selector?) {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: target, action: action)
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
    
    /**
     *  @brief [Right] 'button', 'target', 'action'
     */
    func setRightNavigationBarButton(button: UIButton, target: Any?, action: Selector?) {
        let barButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
}
