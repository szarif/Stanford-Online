//
//  ViewController.swift
//  Calculator
//
//  Created by szarif on 5/28/17.
//  Copyright © 2017 szarif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var isTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if isTyping {
                display.text = display.text! + digit
            }
            else {
                display.text = digit
                isTyping = true
            }
        }
    }

    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if isTyping {
            brain.setOperand(displayValue)
            isTyping = false
        }
        
        if let symbol = sender.currentTitle {
            brain.performOperation(symbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }


}

