//
//  ValidationEnums.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit
import Foundation

enum Alert {        //for failure and success results
    case success
    case failure
    case error
}
//for success or failure of validation with alert message
enum Valid {
    case success
    case failure(Alert)
}
enum ValidationType {
    case email
    case stringWithFirstLetterCaps
    case price
    case alphabeticString
    case year
}
enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case year = "[0-9]{1,4}" // Year length 1-4
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$" // e.g. hello sandeep
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$" // SandsHell
    case price = "[0-9$]{1,14}" // PhoneNo 1-14 Digits        //Change RegEx according to your Requirement
}

enum AlertMessages: String {
    case inValidEmail = "InvalidEmail"
    case invalidFirstLetterCaps = "First Letter should be capital"
    case inValidPrice = "Invalid Price"
    case invalidAlphabeticString = "Invalid String"
    case inValidYEAR = "Invalid Year"
    
    //  case emptyPrice = "Empty Price"
    case emptyEmail = "Empty Email"
    case emptyFirstLetterCaps = "Empty Name"
    case emptyAlphabeticString = "Empty String"
    // case emptyYEAR = "Empty Year"
    
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
