//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Bennet Ngan on 2022-08-29.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmiValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight/(height*height)
        
        if bmi < 18.5 {
            bmiValue = BMI(value: bmi, advice: "You are underweight, eat more pies!", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        } else if bmi < 24.9 {
            bmiValue = BMI(value: bmi, advice: "You are fit as a fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmiValue = BMI(value: bmi, advice: "You are overweight, eat less pies!", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
        //bmiValue = BMI(value: bmi, advice: String, color: <#T##UIColor#>)
    }
    
    mutating func getBMIValue() -> String {
        let returnBMI = String(format: "%.1f", bmiValue?.value ?? 0.0)
        return returnBMI
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? "No advice."
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
