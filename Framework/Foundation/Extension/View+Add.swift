//
//  View+Add.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/2.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ActionManager

class ActionManager: NSObject {
    var actionDict:Dictionary<NSValue,()->()> = Dictionary()
    static let sharedManager = ActionManager()
    override private init(){}
}

// MARK: - UIView extension

extension UIView {
    func addAction(closure:@escaping ()->()){
        let tap = UITapGestureRecognizer(target: self, action: Selector(("tapClick:")))
        self.addGestureRecognizer(tap)
        ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: self)] = closure
    }
    
    func tapClick(tap:UITapGestureRecognizer){
        if let closure = ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: tap.view)]{
            closure()
        }else{
            
        }
    }
}


