//
//  ThirdVC.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    var userName = ""
    var userLastName = ""
    var email = ""
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        nextButtonLabel.isHidden = true
        emailTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)
        
        self.hideKeyboardWhenTappedAround()
    }

        @IBAction func nextButtonClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "FourthVC") as! FourthVC
        let nC = self.navigationController as! CustomNavigationController
        nextVC.user = UserModel(firstName: userName, lastName: userLastName, email: email)
        nextVC.timerInfo = nC.timerInfo

        self.show(nextVC, sender: nil)
    }
    
}
