//
//  Singleton.swift
//  readmate
//
//  Created by fallen.ink on 01/07/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

class Singleton {
    /**
     * @knowledge
     * let定义的属性本身就是thread safe的，同时static定义的是一个class constant，拥有全局作用域和懒加载特性。
     */
    static let sharedInstance = Singleton()
    
    private init() {}
}
