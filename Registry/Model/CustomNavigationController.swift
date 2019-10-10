//
//  CustomNavigationController.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
    
    var shapeLayer: CAShapeLayer!
    var percentageLabel: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCircleLayers()
        setupPercentageLabel()
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if TimerData.currentTime >= 0 {
            percentageLabel.text = "\(Int(TimerData.currentTime))"
            TimerData.currentTime -= 1.0
            animateBlueCircleTo(value: CGFloat(TimerData.currentTime/TimerData.duration.rawValue))
        } else {
            TimerData.isExpired = true
            percentageLabel.text = "End"
        }
    }
    
    private func setupPercentageLabel() {
        percentageLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .black
            return label
        }()
        
        view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: navigationBar.frame.size.width/2 - 35, y: navigationBar.frame.size.height + 45 + 35, width: 65, height: 40)
    }
    
    private func createBlueCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 50, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 7
        layer.fillColor = fillColor.cgColor
        layer.position = CGPoint(x: navigationBar.frame.size.width/2, y: navigationBar.frame.size.height + 50 + 50)
        return layer
    }
    
    private func setupCircleLayers() {
        
        let color: UIColor = #colorLiteral(red: 0.2650902867, green: 0.7006292939, blue: 0.9611788392, alpha: 1)
        
        shapeLayer = createBlueCircleShapeLayer(strokeColor: color, fillColor: .clear)
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        view.layer.addSublayer(shapeLayer)
    }
    
    fileprivate func animateBlueCircleTo(value: CGFloat) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.duration = CFTimeInterval(1)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.strokeEnd = value
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
}
