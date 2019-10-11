//
//  ValidationExtensions.swift
//  Registry
//
//  Created by Arsen on 10/10/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import Foundation
import UIKit


extension UserEmailVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldChanged() {
        
        
        if  emailTF.text?.isEmpty == false  {
            let response = Validation.shared.validate(values: (ValidationType.email, emailTF.text!))
            
            switch response {
            case .success:
                emailTF.textColor = .black
                email = emailTF.text!
                nextButtonLabel.isHidden = false
                break
                
            case .failure(_):
                emailTF.textColor = .red
                nextButtonLabel.isHidden = true
            }
        }
        
    }
    
}


extension UserNameVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldChanged() {
        
        if firstCheck && secondCheck {
            self.nextButtonLabel.isHidden = false
        } else {
            self.nextButtonLabel.isHidden = true
        }
        
        if  firstNameTF.text?.isEmpty == false  {
            let response = Validation.shared.validate(values: (ValidationType.stringWithFirstLetterCaps, firstNameTF.text!))
            
            switch response {
            case .success:
                firstNameTF.textColor = .black
                firstCheck = true
                name = firstNameTF.text ?? ""
                break
                
            case .failure(_):
                firstNameTF.textColor = .red
                firstCheck = false
            }
        }
        if lastNameTF.text?.isEmpty == false {
            let response = Validation.shared.validate(values: (ValidationType.stringWithFirstLetterCaps, lastNameTF.text!))
            
            switch response {
            case .success:
                lastNameTF.textColor = .black
                lastName = lastNameTF.text ?? ""
                secondCheck = true
                break
            case .failure(_):
                lastNameTF.textColor = .red
                secondCheck = false
            }
        }
    }
    
}

