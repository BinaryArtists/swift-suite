//
//  _Core.swift
//  readmate
//
//  Created by 7 on 03/08/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation

// MARK: - _System struct

/// This class adds some useful functions for the App.

struct _Core {
    // MARK: - Variables
    
    /// Used to store the HasBeenOpened in defaults.
    private static let AppHasBeenOpened = "BFAppHasBeenOpened"
    
    // MARK: - Functions
    
    /// Executes a block only if in DEBUG mode.
    ///
    /// [Usage](http://stackoverflow.com/questions/26890537/disabling-nslog-for-production-in-swift-project/26891797#26891797).
    public static func debug(_ block: () -> Void) {
        #if DEBUG
            block()
        #endif
    }
    
    /// Executes a block only if NOT in DEBUG mode.
    public static func release(_ block: () -> Void) {
        #if !DEBUG
            block()
        #endif
    }
    
    /// If version is set returns if is first start for that version,
    /// otherwise returns if is first start of the App.
    ///
    /// - Parameter version: Version to be checked, you can use the variable BFApp.version to pass the current App version.
    /// - Returns: Returns if is first start of the App or for custom version.
    public static func isFirstStart(version: String = "") -> Bool {
        let key: String = BFAppHasBeenOpened + "\(version)"
        
        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)
        
        return !hasBeenOpened
    }
    
    /// Executes a block on first start of the App, if version is set it will be for given version.
    ///
    /// Remember to execute UI instuctions on main thread.
    ///
    /// - Parameters:
    ///   - version: Version to be checked, you can use the variable BFApp.version to pass the current App version.
    ///   - block: The block to execute, returns isFirstStart.
    public static func onFirstStart(version: String = "", block: (_ isFirstStart: Bool) -> Void) {
        let key: String
        if version == "" {
            key = BFAppHasBeenOpened
        } else {
            key = BFAppHasBeenOpened + "\(version)"
        }
        
        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)
        if hasBeenOpened != true {
            defaults.set(true, forKey: key)
        }
        
        block(!hasBeenOpened)
    }
    
    /// Set the App setting for a given object and key. The file will be saved in the Library directory.
    ///
    /// - Parameters:
    ///   - object: Object to set.
    ///   - objectKey: Key to set the object.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    @discardableResult
    public static func setAppSetting(object: Any, forKey objectKey: String) -> Bool {
        return FileManager.default.setSettings(filename: BFApp.name, object: object, forKey: objectKey)
    }
    
    /// Get the App setting for a given key.
    ///
    /// - Parameter objectKey: Key to get the object.
    /// - Returns: Returns the object for the given key.
    public static func getAppSetting(objectKey: String) -> Any? {
        return FileManager.default.getSettings(filename: BFApp.name, forKey: objectKey)
    }
}

// MARK: - BFApp extension

/// Extends BFApp with project infos.
public extension _Core {
    // MARK: - Variables
    
    /// Return the App name.
    public static var name: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleDisplayName")
    }()
    
    /// Returns the App version.
    public static var version: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleShortVersionString")
    }()
    
    /// Returns the App build.
    public static var build: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleVersion")
    }()
    
    /// Returns the App executable.
    public static var executable: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleExecutable")
    }()
    
    /// Returns the App bundle.
    public static var bundle: String = {
        return _Core.stringFromInfoDictionary(forKey: "CFBundleIdentifier")
    }()
    
    // MARK: - Functions
    
    /// Returns a String from the Info dictionary of the App.
    ///
    /// - Parameter key: Key to search.
    /// - Returns: Returns a String from the Info dictionary of the App.
    private static func stringFromInfoDictionary(forKey key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary, let value = infoDictionary[key] as? String else {
            return ""
        }
        
        return value
    }
}

