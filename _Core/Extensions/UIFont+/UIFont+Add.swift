//
//  UIFont+Add.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/3.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation

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
                return UIFont.systemFontOfSize(fontSize * CGFloat(scale))
            default:
                return UIFont.systemFontOfSize(fontSize)
        }
    }
}


let level001Font = UIFont.systemScaleFontSize(16)
let leve1002Font = UIFont.systemScaleFontSize(15)
let leve1003Font = UIFont.systemScaleFontSize(14)
let leve1004Font = UIFont.systemScaleFontSize(12)
