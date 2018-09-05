//
//  PasswordUtil.swift
//  readmate
//
//  Created by 7 on 03/08/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import Foundation

// MARK: - BFPassword struct

/// This struct adds some useful functions to manage passwords.
public struct _PasswordUtil {
    // MARK: - Variables
    
    /// Password strength level enum, from 0 (min) to 6 (max).
    ///
    /// - veryWeak:   Password strength very weak.
    /// - weak:       Password strength weak.
    /// - average:    Password strength average.
    /// - strong:     Password strength strong.
    /// - veryStrong: Password strength very strong.
    /// - secure:     Password strength secure.
    /// - verySecure: Password strength very secure.
    public enum PasswordStrengthLevel: Int {
        case veryWeak
        case weak
        case average
        case strong
        case veryStrong
        case secure
        case verySecure
    }
    
    // MARK: - Functions
    
    /// Check the password strength level.
    ///
    /// - Rarameter password: Password string.
    /// - Returns: Returns the password strength level with value from enum PasswordStrengthLevel.
    public static func strength(password: String) -> PasswordStrengthLevel {
        switch lengthScore(password) + numbersScore(password) + symbolsScore(password) + lowercasedCharactersScore(password) + uppercasedCharactersScore(password) {
        case 0...49:
            return .veryWeak
        case 50...59:
            return .weak
        case 60...69:
            return .average
        case 70...79:
            return .strong
        case 80...89:
            return .veryStrong
        case 90...99:
            return .secure
        case 100:
            return .verySecure
        default:
            return .veryWeak
        }
    }
    
    /// Return the score based on password length.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on password length.
    private static func lengthScore(_ password: String) -> Int {
        let lenght = password.length
        
        switch lenght {
        case 0...4:
            return 5
        case 5...8:
            return 10
        case 9...Int.max:
            return 20
        default:
            return 0
        }
    }
    
    /// Return the score based on number of numbers in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of numbers in password.
    private static func numbersScore(_ password: String) -> Int {
        let numbers = password.countNumbers()
        
        switch numbers {
        case 1:
            return 10
        case 2:
            return 15
        case 3...Int.max:
            return 20
        default:
            return 0
        }
    }
    
    /// Return the score based on number of symbols in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of symbols in password.
    private static func symbolsScore(_ password: String) -> Int {
        let symbols = password.countSymbols()
        
        switch symbols {
        case 1:
            return 15
        case 2:
            return 20
        case 3...Int.max:
            return 25
        default:
            return 0
        }
    }
    
    /// Return the score based on number of lowercased characters in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of lowercased characters in password.
    private static func lowercasedCharactersScore(_ password: String) -> Int {
        let lowercasedCharacters = password.countLowercasedCharacters()
        
        switch lowercasedCharacters {
        case 1:
            return 5
        case 2:
            return 7
        case 3...Int.max:
            return 10
        default:
            return 0
        }
    }
    
    /// Return the score based on number of uppercased characters in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of uppercased characters in password.
    private static func uppercasedCharactersScore(_ password: String) -> Int {
        let uppercasedCharacters = password.countUppercasedCharacters()
        
        switch uppercasedCharacters {
        case 1:
            return 10
        case 2:
            return 15
        case 3...Int.max:
            return 25
        default:
            return 0
        }
    }
}
