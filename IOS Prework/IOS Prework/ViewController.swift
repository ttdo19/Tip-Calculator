//
//  ViewController.swift
//  IOS Prework
//
//  Created by Trang Do on 7/13/22.
//

import UIKit

class ViewController: UIViewController {
    var total: Double = 0.0
    var tip : Double = 0.0
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var specificTipPercent: UISlider!
    @IBOutlet weak var currentValue: UILabel!
   
    @IBOutlet weak var peopleNum: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        specificTipPercent.isHidden = true
        currentValue.isHidden = true
        stepper.value = 1
        stepper.minimumValue = 1
    }

    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        peopleNum.text = "1"
        stepper.value = 1
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentage = [0.15, 0.18, 0.2]
        var tip = 0.0
        if (tipControl.selectedSegmentIndex != 3) {
            tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
            self.currentValue.isHidden = true
            self.specificTipPercent.isHidden = true
        } else {
            self.specificTipPercent.isHidden = false
            self.currentValue.isHidden = false
        }

        let total = bill + tip
        self.tip = tip
        self.total = total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateSpecificTip(_ sender: Any) {
        peopleNum.text = "1"
        stepper.value = 1
        currentValue.text =  String(format: "%.0f%%", specificTipPercent.value * 100)
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercent = specificTipPercent.value
        let tip = bill * Double(tipPercent)
        let total = bill + tip
        self.tip = tip
        self.total = total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        peopleNum.text = Int(stepper.value).description
        let tip = self.tip / stepper.value
        let total = self.total / stepper.value
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

