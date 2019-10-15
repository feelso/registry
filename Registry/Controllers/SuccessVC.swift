//
//  FifthVC.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class SuccessVC: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var resultText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfo()
        resultLabel.text = resultText
    }
    
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
        if let startVC = self.instantiateViewControllerOnMain(withClass: StartVC.self) {
            CustomNavigationController.resetAllDefaults()
  
            self.present(startVC, animated: true, completion: nil)
        }
    }
  
    private func setupInfo() {
        if let data = UserDefaults.standard.value(forKey: String(describing: SuccessVC.self)) as? String {
                resultText = data
            }
        }
    
    }


