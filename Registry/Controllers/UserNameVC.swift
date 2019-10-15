//
//  SecondVC.swift
//  Registry
//
//  Created by Arsen on 10/8/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class UserNameVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    
    var firstCheck = false
    var secondCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfo()
        CustomNavigationController.saveStackOfControllers(from: self)
        
        self.handleTap()
        
        firstNameTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)
        lastNameTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {

        if let userEmailVC = self.instantiateViewControllerOnMain(withClass: UserEmailVC.self) {
            UserModel.user.firstName = firstNameTF.text!
            UserModel.user.lastName = lastNameTF.text!

            self.navigationController?.pushViewController(userEmailVC, animated: true)
        }
    }
    
    private func setupInfo() {
        
        if let name = UserModel.user.firstName, let lastName = UserModel.user.lastName {
            firstNameTF.text = name
            lastNameTF.text = lastName
        }
        
    }
}

