//
//  UIFont+Add.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/3.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation

extension UIFont{

    /**
     判断设备输入不同的比例
    
     - parameter fontSize:
     */
    class func systemScaleFontSize(fontSize:CGFloat) ->UIFont{
        return  UIFont.systemFontOfSize(fontSize)
    }
    
    
}