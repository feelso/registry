//
//  SecondVC.swift
//  Registry
//
//  Created by Arsen on 10/8/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    var firstCheck = false
    var secondCheck = false
    
    var name = ""
    var lastName = ""
    var checker = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(checker, forKey: "checkView2")

        fillInfo()
        
        self.hideKeyboardWhenTappedAround()
        firstNameTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)
        lastNameTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)

    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        let userInfo = [name, lastName]
        nextVC.userName = firstNameTF.text!
        nextVC.userLastName = lastNameTF.text!
        UserDefaults.standard.setValue(userInfo, forKey: "view2")
        UserDefaults.standard.removeObject(forKey: "checkView2")
        self.show(nextVC, sender: nil)
    }
    
    func fillInfo() {
        if let data = UserDefaults.standard.stringArray(forKey: "view2") {
                firstNameTF.text = data[0]
                lastNameTF.text = data[1]
                nextButtonLabel.isHidden = false
        } else {
            firstNameTF.text = nil
            lastNameTF.text = nil
        }
    }
    
}

