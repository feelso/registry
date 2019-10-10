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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultText
    }
    
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "FirstVC") as! ViewController
            self.present(secondViewController, animated: true, completion: nil)
        }
    
    }


