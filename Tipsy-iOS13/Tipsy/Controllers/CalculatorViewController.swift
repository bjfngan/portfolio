//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var splitNum = 2.0
    var total = 0.0
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
       
        sender.isSelected = true
        
        var buttonTitle = sender.currentTitle!
        buttonTitle = String(buttonTitle.dropLast())
        tip = Double(buttonTitle)!/100
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNum = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != ""{
            let billSubTotal = Double(billTextField.text!)
            total = (billSubTotal!*(1+tip))/splitNum
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billTotal = String(format: "%.2f", total)
            destinationVC.splitNum = Int(splitNum)
            destinationVC.tip = String(tip*100)
        }
    }
}

