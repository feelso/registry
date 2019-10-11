//
//  FourthVC.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class FourthVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    var user: UserModel?
    var timerInfo: TimerModel?
    var checker = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInfo()
        UserDefaults.standard.set(checker, forKey: "checkView4")

    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        guard let timerInfo = timerInfo else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "FifthVC") as! FifthVC
        let text = "You needed: \(Int(timerInfo.duration.rawValue - timerInfo.currentTime)) seconds"
        nextVC.resultText = text

        UserDefaults.standard.set(text, forKey: "view5")
        UserDefaults.standard.removeObject(forKey: "checkView4")

        timerInfo.timer.invalidate()

        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    func fillInfo() {
     
        if let user = user {
            nameLabel.text = user.firstName
            lastNameLabel.text = user.lastName
            emailLabel.text = user.email
        } else {
            if let data = UserDefaults.standard.stringArray(forKey: "view3") {
                user = UserModel(firstName: data[0], lastName: data[1], email: data[2])
                nameLabel.text = data[0]
                lastNameLabel.text = data[1]
                emailLabel.text = data[2]
            }
        }

    }
}
    

