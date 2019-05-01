//
//  _Log.swift
//  readmate
//
//  Created by 7 on 03/08/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation

// MARK: - Global functions

/// The private BFLogClass created to manage the log strings.
public struct BFLog {
    // MARK: - Variables
    
    /// Activate or not BFLog.
    public static var active: Bool = false
    
    /// The log string.
    public static var logged: String = ""
    /// The detailed log string.
    public static var detailedLog: String = ""
    
    // MARK: - Functions
    
    /// Exenteds NSLog.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func log(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        if self.active {
            var _message = message
            if _message.hasSuffix("\n") == false {
                _message += "\n"
            }
            
            self.logged += _message
            
            let filenameWithoutExtension = NSURL(string: String(describing: NSString(utf8String: filename)!))!.deletingPathExtension!.lastPathComponent
            let log = "\(filenameWithoutExtension):\(line) \(function): \(_message)"
            let timestamp = Date().description(dateSeparator: "-", usFormat: true, nanosecond: true)
            print("\(timestamp) \(filenameWithoutExtension):\(line) \(function): \(_message)", terminator: "")
            
            self.detailedLog += log
        }
    }
    
    /// Exenteds NSLog with a warning sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func warning(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        self.log("⚠️ \(message)", filename: filename, function: function, line: line)
    }
    
    /// Exenteds NSLog with an error sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func error(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        self.log("❗️ \(message)", filename: filename, function: function, line: line)
    }
    
    /// Exenteds NSLog with a debug sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func debug(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        self.log("🔵 \(message)", filename: filename, function: function, line: line)
    }
    
    /// Exenteds NSLog with an info sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func info(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        self.log("ℹ️ \(message)", filename: filename, function: function, line: line)
    }
    
    /// Clear the log string.
    public static func clear() {
        logged = ""
        detailedLog = ""
    }
    
    /// Save the Log in a file.
    ///
    /// - Parameters:
    ///   - path: Save path.
    ///   - filename: Log filename.
    /// - Throws: write(toFile:, atomically:, encoding:) errors.
    public static func saveLog(in path: FileManager.PathType, filename: String) throws {
        try FileManager.default.save(file: filename, in: path, content: self.detailedLog)
    }
}