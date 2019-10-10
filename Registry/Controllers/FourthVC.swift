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
    
    var user: UserModel!
    var timerInfo: TimerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
        emailLabel.text = user.email
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        guard let timerInfo = timerInfo else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "FifthVC") as! FifthVC
        nextVC.resultText = "You needed: \(Int(timerInfo.duration.rawValue - timerInfo.currentTime)) seconds"
        timerInfo.timer.invalidate()
      
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
