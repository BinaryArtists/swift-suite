//
//  _CellHelper.swift
//  readmate
//
//  Created by 7 on 03/08/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Cell feature

extension UITableViewCell {
    static var id: String {
        return String(describing: self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}

extension UICollectionViewCell {
    static var id: String {
        return String(describing: self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}

// MARK: - Cell convention

extension UITableViewCell {
    
    // MARK: - Data I/O
    
    func setup() { }
    func setdown(_ model: AnyObject) { }
    
    // MARK: -
    
    
}

extension UICollectionViewCell {
    
    // MARK: - Data I/O
    
    func setup() { }
    func setdown(_ model: AnyObject) { }
    
    // MARK: -
    
}

