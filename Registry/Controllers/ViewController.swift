//
//  ViewController.swift
//  Registry
//
//  Created by Arsen on 10/8/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timerDuration: TimerData.Duration = .light
    var currentTime: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func levelButtonClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            TimerData.duration = .light
            TimerData.currentTime = TimerData.Duration.light.rawValue
        } else if sender.tag == 1 {
            TimerData.duration = .middle
            TimerData.currentTime = TimerData.Duration.middle.rawValue
        } else {
            TimerData.duration = .hard
            TimerData.currentTime = TimerData.Duration.hard.rawValue
        }
        
        performSegue(withIdentifier: "view2", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "view2" {

        }
    }

}

