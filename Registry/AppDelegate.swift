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

    
    func removeAllDefaults() {
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
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // removeAllDefaults()
        
        notifications.notificationCenter.delegate = notifications
        notifications.userRequest()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let navC = storyboard.instantiateViewController(withIdentifier: "navController") as!   CustomNavigationController
       
        if let date2 = UserDefaults.standard.object(forKey: "date") as? Date, let duration = UserDefaults.standard.object(forKey: "duration"), let currentTime = UserDefaults.standard.object(forKey: "currentTime") as? CGFloat {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            
            let timeDifference = Date().timeIntervalSince(date2)
            let newCurrentTime = Double(currentTime) - timeDifference
            
            if let dur = TimerModel.Duration(rawValue: duration as! CGFloat) {
                navC.timerInfo = TimerModel(duration: dur)
                navC.timerInfo?.currentTime = CGFloat(newCurrentTime)
            }
            
            if UserDefaults.standard.value(forKey: "checkView2") != nil {
                self.window?.rootViewController = navC
                self.window?.makeKeyAndVisible()
            } else if UserDefaults.standard.value(forKey: "checkView3") != nil {
                let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
                self.window?.rootViewController = navC
                navC.show(thirdVC, sender: nil)
                self.window?.makeKeyAndVisible()
            } else if UserDefaults.standard.value(forKey: "checkView4") != nil {
                let fourthVC = storyboard.instantiateViewController(withIdentifier: "FourthVC") as! FourthVC
                self.window?.rootViewController = navC
                navC.pushViewController(fourthVC, animated: true)
                self.window?.makeKeyAndVisible()
            } else if UserDefaults.standard.value(forKey: "checkView5") != nil {
                let fifthVC = storyboard.instantiateViewController(withIdentifier: "FifthVC") as! FifthVC
                self.window?.rootViewController = fifthVC
                self.window?.makeKeyAndVisible()
            } else {
                self.window?.rootViewController = navC
                self.window?.makeKeyAndVisible()
            }
        }

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        if let cur = timerInfo?.currentTime, let dur = timerInfo?.duration.rawValue {
            let date = Date()
            UserDefaults.standard.setValue(date, forKey: "date")
            UserDefaults.standard.set(dur, forKey: "duration")
            UserDefaults.standard.set(cur, forKey: "currentTime")
            self.notifications.scheduleNotification(interval: Double(cur))
        }
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
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
