//
//  View+Add.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/2.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation

class ActionManager:NSObject{
    var actionDict:Dictionary<NSValue,()->()> = Dictionary()
    static let sharedManager = ActionManager()
    override private init(){}
}


extension UIView{
    func addAction(closure:()->()){
        let tap = UITapGestureRecognizer(target: self, action: "tapClick:")
        self.addGestureRecognizer(tap)
        ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: self)] = closure
    }
    
    func tapClick(tap:UITapGestureRecognizer){
        if let closure = ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: tap.view)]{
            closure()
        }else{
            
        }
        debugPrint("action打印")
    }
}
