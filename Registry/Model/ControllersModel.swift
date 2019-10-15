//
//  ControllersModel.swift
//  Registry
//
//  Created by Arsen on 10/11/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit
import Foundation

enum Controllers: String {
        case CustomNavigationController
        case StartVC
        case UserNameVC
        case UserEmailVC
        case ConfirmationVC
        case SuccessVC
        
        var viewController: UIViewController  {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
            switch self {
            
            case .CustomNavigationController:
                return storyboard.instantiateViewController(withIdentifier: self.rawValue) as! CustomNavigationController
            case .StartVC:
                return storyboard.instantiateViewController(withIdentifier: self.rawValue) as! StartVC
            case .UserNameVC:
                return storyboard.instantiateViewController(withIdentifier: self.rawValue) as! UserNameVC
            case .UserEmailVC:
                return storyboard.instantiateViewController(withIdentifier: self.rawValue) as! UserEmailVC
            case .ConfirmationVC:
                return storyboard.instantiateViewController(withIdentifier: self.rawValue) as! ConfirmationVC
            case .SuccessVC:
                return storyboard.instantiateViewController(withIdentifier: self.rawValue) as! SuccessVC

            }
        }

    }
