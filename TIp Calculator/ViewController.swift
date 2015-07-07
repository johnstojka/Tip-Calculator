//
//  ViewController.swift
//  TIp Calculator
//
//  Created by John Stojka  on 6/30/15.
//  Copyright © 2015 John Stojka . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipControl2: UISegmentedControl!
    
    @IBOutlet weak var tipCalculatorTitle: UILabel!
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipDollarSign: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalDollarSign: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    var numberPeople = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greenImage.png")!)
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        calculate()
    }
    
    
    @IBAction func tipControl2Updated(sender: AnyObject) {
        var possibleNumberPeople = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        numberPeople = possibleNumberPeople[tipControl2.selectedSegmentIndex]
        calculate()
    }
    
    func calculate() {
        if billTextField.text != nil {
            
            var tipPercentages = [0.1, 0.15, 0.2, 0.25]
            let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
            let billAmount = Double(billTextField.text!)
            
            if (billAmount != nil){
                var tip = billAmount! * tipPercentage
                tip = tip / Double(numberPeople)
                var total = billAmount! + tip
                total = total / Double(numberPeople)
                
                tipAmountLabel.text = String(format: "%.2f", tip)
                totalAmountLabel.text = String(format: "%.2f", total)
            }
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

