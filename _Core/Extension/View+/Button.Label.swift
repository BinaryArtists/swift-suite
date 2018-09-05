//
//  Button.Label.swift
//  SwiftProject
//
//  Created by fallen.ink on 12/15/15.
//  Copyright © 2015 王涛. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    /**
     *  @desc 让按钮的图像、标题居中
     */
    func centerImageAndTitle(spacing:CGFloat) {
        // get the size of the elements here for readability
        let imageSize = self.imageView!.frame.size;
        let titleSize = self.titleLabel!.frame.size;
        
        // get the height they will take up as a unit
        let totalHeight = (imageSize.height + titleSize.height + spacing);
        
        // raise the image and push it right to center it
        self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize.height), 0.0, 0.0, -titleSize.width);
        
        // lower the text and push it left to center it
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(totalHeight - titleSize.height), 0.0);
    }
}