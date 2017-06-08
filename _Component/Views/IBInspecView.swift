//
//  IBInspecView.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/17.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation

// @IBDesignable 可以实时渲染

@IBDesignable class IBInspectableImageView: UIImageView {
    @IBInspectable var kCornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = kCornerRadius
            layer.masksToBounds = true
        }
    }
}

@IBDesignable class IBInspectableButton: UIButton {
    @IBInspectable var kCornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = kCornerRadius
            layer.masksToBounds = true
        }
    }
    @IBInspectable var kCanHighlight: Bool = true
    
    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        set {
            super.highlighted = kCanHighlight
        }
    }
}
 