//
//  ViewController.swift
//  Registry
//
//  Created by Arsen on 10/8/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit

class StartVC: UIViewController {

    var duration: TimerModel.Duration?

        override func viewDidLoad() {
        super.viewDidLoad()
            CustomNavigationController.saveStackOfControllers(from: self)
    }
    
    @IBAction func levelButtonClicked(_ sender: UIButton) {
     
        if sender.tag == 0 {
            duration = .light
        } else if sender.tag == 1 {
            duration = .middle
        } else {
            duration = .hard
        }

        if let dur = duration {
            let timerInfo = TimerModel(duration: dur)
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                let navC = self.instantiateViewControllerOnMain(withClass: CustomNavigationController.self) {
                
                appDelegate.timerInfo = timerInfo
                navC.timerInfo = timerInfo
                
                self.show(navC, sender: nil)
            }
        }
    }
    

}


extension UIViewController {
    
    func instantiateViewControllerOnMain<T>(withClass cls: T.Type) -> T? {
        let storyboardMain = "Main"
        return instantiateViewController(withClass: cls, on: storyboardMain)
    }
    
    func instantiateViewController<T>(withClass cls: T.Type, on storyboardName: String) -> T? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T
    }
    
}

