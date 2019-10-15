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
        
        notifications.notificationCenter.delegate = notifications
        notifications.userRequest()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navC = storyboard.instantiateViewController(withIdentifier: String(describing: CustomNavigationController.self)) as! CustomNavigationController
        
        
        if let date2 = UserDefaults.standard.object(forKey: "date") as? Date,
            let duration = UserDefaults.standard.object(forKey: TimerModel.TimerInfo.duration.rawValue),
            let currentTime = UserDefaults.standard.object(forKey: TimerModel.TimerInfo.currentTime.rawValue) as? CGFloat {
            
            UserModel.getUserInfoIfExists()
            
            let timeDifference = Date().timeIntervalSince(date2)
            let newCurrentTime = Double(currentTime) - timeDifference
            
            if let dur = TimerModel.Duration(rawValue: duration as! CGFloat) {
                navC.timerInfo = TimerModel(duration: dur)
                navC.timerInfo?.currentTime = CGFloat(newCurrentTime)
            }
            
            self.window = UIWindow(frame: UIScreen.main.bounds)
            
            if UserDefaults.standard.object(forKey: String(describing: SuccessVC.self)) != nil {
                self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: String(describing: SuccessVC.self))
            } else {
                self.window?.rootViewController = navC
            }
                self.window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        if let cur = timerInfo?.currentTime, let dur = timerInfo?.duration.rawValue {
            let date = Date()
            
            UserDefaults.standard.setValue(date, forKey: "date")
            UserDefaults.standard.set(dur, forKey: TimerModel.TimerInfo.duration.rawValue)
            UserDefaults.standard.set(cur, forKey: TimerModel.TimerInfo.currentTime.rawValue)
            
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
