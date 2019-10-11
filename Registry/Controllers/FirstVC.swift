//
//  ViewController.swift
//  Registry
//
//  Created by Arsen on 10/8/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit

class FirstVC: UIViewController {

    var duration: TimerModel.Duration?

        override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func levelButtonClicked(_ sender: UIButton) {
     
        if sender.tag == 0 {
            duration = .light
        } else if sender.tag == 1 {
            duration = .middle
        } else {
            duration = .hard
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navC = storyboard.instantiateViewController(withIdentifier: "navController") as! CustomNavigationController
        if let dur = duration {
            let timerInfo = TimerModel(duration: dur)
            navC.timerInfo = timerInfo
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.timerInfo = timerInfo
            }
            self.show(navC, sender: nil)
        }
    }
  
    static func removeAllDefaults() {
        UserDefaults.standard.removeObject(forKey: "date")
        UserDefaults.standard.removeObject(forKey: "duration")
        UserDefaults.standard.removeObject(forKey: "currentTime")
        UserDefaults.standard.removeObject(forKey: "view2")
        UserDefaults.standard.removeObject(forKey: "view3")
        UserDefaults.standard.removeObject(forKey: "view4")
        UserDefaults.standard.removeObject(forKey: "view5")
        UserDefaults.standard.removeObject(forKey: "checkView2")
        UserDefaults.standard.removeObject(forKey: "checkView3")
        UserDefaults.standard.removeObject(forKey: "checkView4")
        UserDefaults.standard.removeObject(forKey: "checkView5")
    }
}
