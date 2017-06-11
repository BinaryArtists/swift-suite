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
    public func textSizeWith(fontSize:CGFloat, width:CGFloat) -> CGSize {
        let font = UIFont.systemScaleFontSize(fontSize: fontSize)
        let size = CGSize(width:width, height:CGFloat.greatestFiniteMagnitude)
        let text = self as NSString
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping;
        let attributes = [NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.size
        
    }
    
    /**
     *
     */
    public func textSizeForOneLineWith(fontSize:CGFloat)->CGSize {
        return self.textSizeWith(fontSize: fontSize, width: CGFloat.greatestFiniteMagnitude)
    }
}
