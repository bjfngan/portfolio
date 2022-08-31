//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Bennet Ngan on 2022-08-28.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var bmiValue: String?
    var color: UIColor?
    var advice: String?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        view.backgroundColor = color
        adviceLabel.text = advice
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
