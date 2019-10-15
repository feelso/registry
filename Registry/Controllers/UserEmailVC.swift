//
//  ThirdVC.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class UserEmailVC: UIViewController {

    var email = ""
    
    var checker = false
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CustomNavigationController.saveStackOfControllers(from: self)
        setupInfo()
        
        emailTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)
        self.handleTap()
        
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if let confirmationVC = self.instantiateViewControllerOnMain(withClass: ConfirmationVC.self) {
            UserModel.user.email = email
            
            if let navC = self.navigationController as? CustomNavigationController {
                confirmationVC.timerInfo = navC.timerInfo
            }
            
            self.navigationController?.pushViewController(confirmationVC, animated: true)
        }
    }
    
    private func setupInfo() {
        
        if let email = UserModel.user.email {
            emailTF.text = email
        }
    }

}
