//
//  View.frame.swift
//  SwiftProject
//
//  Created by fallen.ink on 12/15/15.
//  Copyright © 2015 王涛. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /**
     *  x, y
     */
    var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
    }
    
    var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /**
     *  bottom, right, width, height
     */
    var bottom:CGFloat {
        return CGRectGetMaxY(self.frame)
    }
    var right:CGFloat {
        return CGRectGetMaxX(self.frame)
    }
    var width:CGFloat {
        get {
            return CGRectGetWidth(self.frame)
        }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    var height:CGFloat {
        get {
            return CGRectGetHeight(self.frame)
        }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /**
     *  origin, size
     */
    var origin:CGPoint {
        get {
            return self.frame.origin
        }
        
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var size:CGSize {
        get {
            return self.frame.size
        }
        
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    /**
     *  centerX, centerY
     */
    var centerX:CGFloat {
        get {
            return self.center.x;
        }
        
        set {
            self.center.x = newValue
        }
    }
    
    var centerY:CGFloat {
        get {
            return self.center.y;
        }
        
        set {
            self.center.y = newValue
        }
    }
}