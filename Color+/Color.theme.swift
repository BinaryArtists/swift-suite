//
//  Color.theme.swift
//  SwiftProject
//
//  Created by fallen.ink on 12/15/15.
//  Copyright © 2015 王涛. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    //主题色--蓝
    public class func themeBlueColor() -> UIColor {
        return UIColor.init(red: (57.0 / 255.0), green: (106.0 / 255.0), blue: (180.0 / 255.0), alpha: 1.0)
    }
    //主题色--绿
    public class func themeGreenColor() -> UIColor {
        return UIColor.init(red: (108.0 / 255.0), green: (185.0 / 255.0), blue: (82.0 / 255.0), alpha: 1.0)
    }
    //主题色--粉
    public class func themePinkColor() -> UIColor {
        return UIColor.init(red: (255.0/255), green: (125.0/255), blue: (140.0/255.0), alpha: 1.0)
    }
    //字体色--灰一
    public class func gray001Color() -> UIColor {
        return UIColor.init(red: (51.0/255), green: (51.0/255), blue: (51.0/255), alpha: 1.0)
    }
    //字体色--灰二
    public class func gray002Color() -> UIColor {
        return UIColor.init(red: (102.0/255), green: (102.0/255), blue: (102.0/255), alpha: 1.0)
    }
    //字体色--灰三
    public class func gray003Color() -> UIColor {
        return UIColor.init(red: (153.0/255), green: (153.0/255), blue: (153.0/255), alpha: 1.0)
    }
    //字体色--灰四
    public class func gray004Color() -> UIColor {
        return UIColor.init(red: (204.0/255), green: (204.0/255), blue: (204.0/255), alpha: 1.0)
    }
}
