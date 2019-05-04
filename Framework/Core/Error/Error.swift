//
//  _Error.swift
//  readmate
//
//  Created by 7 on 03/08/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation

/// BFKit errors enum.
///
/// - jsonSerialization: JSONSerialization error.
/// - errorLoadingSound: Could not load sound error.
/// - pathNotExist: Path not exist error.
/// - pathNotAllowed: Path not allowed error.
public enum _Error: Error {
    case jsonSerialization
    case errorLoadingSound
    case pathNotExist
    case pathNotAllowed
}
