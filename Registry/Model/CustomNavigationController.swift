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
    let notifications = Notifications()

    var timerInfo: TimerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCircleLayers()
        setupPercentageLabel()
        runTimer()
        
    }
    
    private func runTimer() {
        guard let timerInfo = timerInfo else { return }
        
        timerInfo.timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc private func presentFirstVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "FirstVC") as! ViewController
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc private func updateTimer() {
        guard let timerInfo = timerInfo else { return }
        
        if timerInfo.currentTime > 0 {
            timerInfo.currentTime -= 1.0
            percentageLabel.text = "\(Int(timerInfo.currentTime))"
            animateBlueCircleTo(value: CGFloat(timerInfo.currentTime/timerInfo.duration.rawValue))
        } else {
            percentageLabel.text = "End"
            showAlert()
        }

    }
    
    private func setupPercentageLabel() {
        let width: CGFloat = 65
        let height: CGFloat = 40

        percentageLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .black
            return label
        }()
        percentageLabel.frame = CGRect(origin: CGPoint(x: shapeLayer.frame.origin.x - width/2,
                                                       y: shapeLayer.frame.origin.y - height/2),
                                       size: CGSize(width: width, height: height))
        
        view.addSubview(percentageLabel)
    }
    
    private func createBlueCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let radius: CGFloat = 50
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 7
        layer.fillColor = fillColor.cgColor
        layer.position = CGPoint(x: navigationBar.frame.size.width/2,
                                 y: navigationBar.frame.size.height + radius * 2)
        return layer
    }
    
    private func showAlert() {
        guard let timerInfo = timerInfo else { return }
        timerInfo.timer.invalidate()
        
        let alert = UIAlertController(title: "",
                                      message: "Your time is left",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.perform(#selector(self.presentFirstVC), with: nil, afterDelay: 0.3)
            self.notifications.scheduleNotification(notificationType: "Registry Game")
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func navigationBarSetup() {
        self.navigationItem.rightBarButtonItem?.title = "1/3"
        self.title = "Your name"
        
    }
    private func setupCircleLayers() {
        
        let color: UIColor = #colorLiteral(red: 0.2650902867, green: 0.7006292939, blue: 0.9611788392, alpha: 1)
        shapeLayer = createBlueCircleShapeLayer(strokeColor: color, fillColor: .clear)
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        view.layer.addSublayer(shapeLayer)
    }
    
    private func animateBlueCircleTo(value: CGFloat) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.duration = CFTimeInterval(1)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.strokeEnd = value
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
}
