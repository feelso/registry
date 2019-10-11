//
//  AppDelegate.swift
//  Registry
//
//  Created by Arsen on 10/8/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notifications = Notifications()
    var timerInfo: TimerModel?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //FirstVC.removeAllDefaults()
        notifications.notificationCenter.delegate = notifications
        notifications.userRequest()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let navC = storyboard.instantiateViewController(withIdentifier: "navController") as!   CustomNavigationController
        
        let fifthVC = storyboard.instantiateViewController(withIdentifier: "FifthVC") as! SuccessVC
        let fourthVC = storyboard.instantiateViewController(withIdentifier: "FourthVC") as! ConfirmationVC
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! UserEmailVC
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! UserNameVC
        
        
        if let date2 = UserDefaults.standard.object(forKey: "date") as? Date, let duration = UserDefaults.standard.object(forKey: "duration"), let currentTime = UserDefaults.standard.object(forKey: "currentTime") as? CGFloat {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            
            let timeDifference = Date().timeIntervalSince(date2)
            let newCurrentTime = Double(currentTime) - timeDifference
            var controllers = [UIViewController]()
            
            if let dur = TimerModel.Duration(rawValue: duration as! CGFloat) {
                navC.timerInfo = TimerModel(duration: dur)
                navC.timerInfo?.currentTime = CGFloat(newCurrentTime)
            }
            self.window?.rootViewController = navC

            if UserDefaults.standard.value(forKey: "view5") != nil {
            self.window?.rootViewController = fifthVC
            } else if UserDefaults.standard.value(forKey: "view4") != nil {
                controllers.append(contentsOf: [secondVC, thirdVC, fourthVC])
            } else if UserDefaults.standard.value(forKey: "view3") != nil {
                controllers.append(contentsOf: [secondVC, thirdVC])
            } else {
                controllers.append(contentsOf: [secondVC])
            }
            
            navC.setViewControllers(controllers, animated: true)

            self.window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        if let cur = timerInfo?.currentTime, let dur = timerInfo?.duration.rawValue {
            let date = Date()
            UserDefaults.standard.setValue(date, forKey: "date")
            UserDefaults.standard.set(dur, forKey: "duration")
            UserDefaults.standard.set(cur, forKey: "currentTime")
            self.notifications.scheduleNotification(interval: Double(cur))
        }
    }
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }

}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi / 180.0)
    }
}
