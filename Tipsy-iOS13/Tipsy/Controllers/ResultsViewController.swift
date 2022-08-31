//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bennet Ngan on 2022-08-30.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var billTotal = "0.0"
    var splitNum = 0
    var tip = "0"
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = billTotal
        settingsLabel.text = "Split between " + String(splitNum) + " people, with " + tip + "% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
