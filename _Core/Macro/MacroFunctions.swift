//
//  MacroFunctions.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/2.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation
import UIKit

/// Debug Log
let DEBUG = true

func LOG(value: Any , fileName : String = #file, line : Int32 = #line ) {
    if DEBUG {
        print("文件：\(NSURL(string: fileName)!.lastPathComponent!)  行：\(line) 内容:\(value)\n")
    }
}

func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red:r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

func NIB(nibName:String) -> UINib {
    return UINib(nibName:nibName, bundle: Bundle.main)
}

let SCREEN_WIDTH:CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height


//MARK:简写的实例化

let TRUE = true
let FALSE = false


//MARK:流水线加工控件
/**
流水线label
居中 背景白色label
- returns: 居中 背景白色label 12号字体 灰度102，102，102  单行
*/
func LABEL() -> UILabel{
    let label = UILabel()
    label.textAlignment = .center
    label.backgroundColor = UIColor.white
    label.font = UIFont.systemFont(ofSize: 12)
    label.numberOfLines = 1
    label.textColor = RGB(r: 102, g: 102, b: 102)
    return label
}

/**
 流水线View
 背景白色
 */
func VIEW() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
}

