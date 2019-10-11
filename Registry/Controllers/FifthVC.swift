//
//  FifthVC.swift
//  Registry
//
//  Created by Arsen on 10/9/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class FifthVC: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var resultText = ""
    var checker = false


    override func viewDidLoad() {
        super.viewDidLoad()
        fillInfo()
        resultLabel.text = resultText
        UserDefaults.standard.set(checker, forKey: "checkView5")

    }
    
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "FirstVC") as! FirstVC
            FirstVC.removeAllDefaults()
            self.present(secondViewController, animated: true, completion: nil)
        }
    
    func fillInfo() {
        if let data = UserDefaults.standard.value(forKey: "view5") as? String {
                resultText = data
            }
        }
    
    }


