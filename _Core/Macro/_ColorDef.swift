//
//  ColorDef.swift
//  readmate
//
//  Created by fallen.ink on 01/07/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation
import UIKit

func color_with_rgb(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    return UIColor(red:red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
}

func color_with_rgba(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
    return UIColor(red:red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}
