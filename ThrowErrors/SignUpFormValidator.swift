//
//  SignUpFormValidator.swift
//  ThrowErrors
//
//  Created by Denis Yaremenko on 3/30/21.
//

import Foundation

class SignUpFormValidator {
    private let invalidCharacters = CharacterSet(charactersIn:"{}$#%*&^,./?!@")
    
    func isFirstNameValid(_ firstName: String) throws -> Bool {
        
        var returnValue = true
        
        if firstName.rangeOfCharacter(from: invalidCharacters) != nil {
            throw SignUpError.illegalCharactersFound
        }
        
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        
        return returnValue
    }
}
