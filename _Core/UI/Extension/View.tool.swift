//
//  View.tool.swift
//  SwiftProject
//
//  Created by qingqing on 16/2/27.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
//    public class func instantiateFromNib() -> Self {
//        let nibs: Array = NSBundle.mainBundle().loadNibNamed(String(self), owner: nil, options: nil);
//        return nibs.first as UIView;
//    }
    
    /**
    *http://stackoverflow.com/questions/24133296/whats-the-equivalent-to-loadnibnamed-in-swift
    
    * may cause crash?????
    */
    
    public class func instantiateFromNib<T: UIView>(viewType: T.Type) -> T {
        return Bundle.main.loadNibNamed(String(describing: viewType), owner: nil, options: nil)!.first as! T
    }
    
    public class func instantiateFromNib() -> Self {
        return instantiateFromNib()
    }
}
