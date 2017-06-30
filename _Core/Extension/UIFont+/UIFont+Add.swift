//
//  UIFont+Add.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/3.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{
    static var scale:CGFloat{
        get {
            return 1.2
        }
    }
    
    /**
     判断设备字体进行放缩
    
     - parameter fontSize:
     */
    class func systemScaleFontSize(fontSize:CGFloat) ->UIFont{
        switch UIDevice.deviceType{
            case .DT_iPhone6_Plus:
                return UIFont.systemFont(ofSize: fontSize * CGFloat(scale))
            default:
                return UIFont.systemFont(ofSize: fontSize)
        }
    }
}


let font_l = UIFont.systemScaleFontSize(fontSize: 16)
let font_m = UIFont.systemScaleFontSize(fontSize: 15)
let font_s = UIFont.systemScaleFontSize(fontSize: 14)
let font_ss = UIFont.systemScaleFontSize(fontSize: 12)
