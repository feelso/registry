//
//  ThirdVC.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class UserEmailVC: UIViewController {

    var userName = ""
    var userLastName = ""
    var email = ""
    
    var checker = false
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(checker, forKey: "checkView3")
        emailTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)

        fillInfo()
        
        self.addGestureOfTapping()
    }

        @IBAction func nextButtonClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "FourthVC") as! ConfirmationVC
        let nC = self.navigationController as! CustomNavigationController
        let user = UserModel(firstName: userName, lastName: userLastName, email: email)
        let userArray = [userName, userLastName, email]
        nextVC.user = user
        nextVC.timerInfo = nC.timerInfo
       
        UserDefaults.standard.setValue(userArray, forKey: "view3")
        UserDefaults.standard.removeObject(forKey: "checkView3")
            
        self.show(nextVC, sender: nil)
    }
    
    func fillInfo() {
        if let data = UserDefaults.standard.stringArray(forKey: "view3") {
        userName = data[0]
        userLastName = data[1]
        email = data[2]
        emailTF.text = email
        nextButtonLabel.isHidden = false

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fourthVC = storyboard.instantiateViewController(withIdentifier: "FourthVC") as! ConfirmationVC
        fourthVC.user = UserModel(firstName: data[0], lastName: data[1], email: data[2])
        }
    }
}
