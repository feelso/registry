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
    
    static var timer = Timer()
    static var duration: Duration = .light
    static var currentTime = Duration.light.rawValue
    
     var dur: Duration
     var cur: CGFloat
     var tim: Timer

    enum Duration: CGFloat {
        case light = 60.0
        case middle = 30.0
        case hard = 5.0
    }
    
    init(dur: Duration) {
        self.dur = dur
        self.cur = dur.rawValue
        self.tim = Timer()
    }

}
