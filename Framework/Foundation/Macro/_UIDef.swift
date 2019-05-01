//
//  UIDef.swift
//  readmate
//
//  Created by fallen.ink on 01/07/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation
import UIKit

let screen_width:CGFloat = UIScreen.main.bounds.size.width
let screen_height:CGFloat = UIScreen.main.bounds.size.height

func nib_with_name(nibName:String) -> UINib {
    return UINib(nibName:nibName, bundle: Bundle.main)
}

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
    label.textColor = color_with_rgb(red: 102, green: 102, blue: 102)
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
