//
//  NotificationCenter+Add.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/2.
//  Copyright © 2016年 王涛. All rights reserved.
//

import Foundation

extension NotificationCenter{
    func postOnMainThread (notification:NSNotification) {
        DispatchQueue.main.async() { () -> Void in
            NotificationCenter.default.post(notification as Notification)
        }
    }
    
    func postNameOnMainThread(aName: String, object: AnyObject?) {
        let not = Notification(name: Notification.Name(rawValue: aName), object: object)
        postNotificationOnMainThread(notification: not as NSNotification)
    }
    
    func postNameOnMainThread(aName:String,object:AnyObject?,userInfo:[NSObject:AnyObject]?) {
        let not = NSNotification(name: NSNotification.Name(rawValue: aName), object: object, userInfo: userInfo)
        postNotificationOnMainThread(notification: not)
    }
}
