//
//  UserModel.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import Foundation

class UserModel {
    
  static let user = UserModel()
    
    enum UserInfo: String {
        case firstName
        case lastName
        case email
    }
    
    var firstName: String? {
        didSet {
            if firstName != nil {
            UserDefaults.standard.setValue(self.firstName, forKey: UserInfo.firstName.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: UserInfo.firstName.rawValue)
            }
        }
    }
    
    var lastName: String? {
        didSet {
            if lastName != nil {
                UserDefaults.standard.setValue(self.lastName, forKey: UserInfo.lastName.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: UserInfo.lastName.rawValue)
            }
        }
    }
    
    
    var email: String? {
        didSet {
            if email != nil {
                UserDefaults.standard.setValue(self.email, forKey: UserInfo.email.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: UserInfo.email.rawValue)
            }
        }
    }
    
  static func getUserInfoIfExists() {
    
        if let name = UserDefaults.standard.value(forKey: UserInfo.firstName.rawValue) as? String {
            user.firstName = name
        }
        if let lastName = UserDefaults.standard.value(forKey: UserInfo.lastName.rawValue) as? String {
            user.lastName = lastName
        }
        if let email = UserDefaults.standard.value(forKey: UserInfo.email.rawValue) as? String {
            user.email = email
        }
    }

}
