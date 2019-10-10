//
//  UserModel.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import Foundation

class UserModel {
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
