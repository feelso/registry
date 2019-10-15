//
//  FourthVC.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class ConfirmationVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    var timerInfo: TimerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfo()
        
        CustomNavigationController.saveStackOfControllers(from: self)


    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        guard let timerInfo = timerInfo else { return }
      
        if let successVC = self.instantiateViewControllerOnMain(withClass: SuccessVC.self) {
            let text = "You needed: \(Int(timerInfo.duration.rawValue - timerInfo.currentTime)) seconds"
            successVC.resultText = text
           
            UserDefaults.standard.set(text, forKey: String(describing: SuccessVC.self))
            
            timerInfo.timer.invalidate()
            
            self.present(successVC, animated: true, completion: nil)
        }
    }
    
    private func setupInfo() {

        if let name = UserModel.user.firstName, let lastName = UserModel.user.lastName, let email = UserModel.user.email {
            nameLabel.text = name
            lastNameLabel.text = lastName
            emailLabel.text = email
        }
        
    }

}
