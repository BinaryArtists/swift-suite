//
//  String.size.swift
//  SwiftProject
//
//  Created by fallen.ink on 12/15/15.
//  Copyright © 2015 王涛. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /**
     *
     */
    public func textSizeWith(fontSize:CGFloat,width:CGFloat)->CGSize{
        let font = UIFont.systemScaleFontSize(fontSize)
        let size = CGSizeMake(width, CGFloat.max)
        let text = self as NSString
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .ByWordWrapping;
        let attributes = [NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let rect = text.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.size
        
    }
    
    /**
     *
     */
    public func textSizeForOneLineWith(fontSize:CGFloat)->CGSize {
        return self.textSizeWith(fontSize, width: CGFloat.max)
    }
}
