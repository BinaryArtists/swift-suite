//
//  SystemDef.swift
//  readmate
//
//  Created by fallen.ink on 01/07/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation

func LOG(value: Any , fileName : String = #file, line : Int32 = #line ) {
    if DEBUG {
        print("file: \(NSURL(string: fileName)!.lastPathComponent!)  line：\(line) content:\(value)\n")
    }
}
