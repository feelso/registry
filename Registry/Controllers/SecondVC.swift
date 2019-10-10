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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonLabel.isHidden = true
        
        self.hideKeyboardWhenTappedAround()
        firstNameTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)
        lastNameTF.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)

    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        nextVC.userName = firstNameTF.text!
        nextVC.userLastName = lastNameTF.text!

        self.show(nextVC, sender: nil)
    }

}

