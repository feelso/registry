//
//  TimerData.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import Foundation
import UIKit

class TimerModel {
    
     var duration: Duration
     var currentTime: CGFloat
     var timer: Timer

    enum Duration: CGFloat {
        case light = 60.0
        case middle = 30.0
        case hard = 10.0
    }
    
    enum TimerInfo: String {
        case duration
        case currentTime
        case timer
    }
    init(duration: Duration) {
        self.duration = duration
        self.currentTime = duration.rawValue
        self.timer = Timer()
    }

}
