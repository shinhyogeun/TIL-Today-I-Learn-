//
//  ViewController.swift
//  CuteCalculator
//
//  Created by 신효근 on 2020/09/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var totalResult: UILabel!
    private var userIsInTheMiddleOfTyping = false
    var savedProgram : CalculateBrain.Propertylist?
    @IBAction private func numberIsPressed(_ sender: UIButton) {
    let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = totalResult.text! + digit
            totalResult.text = textCurrentlyInDisplay
        }else{
            totalResult.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }

    private var displayValue : Double {
        get{
            return Double(totalResult.text!)!
        }
        set{
            totalResult.text = String(newValue)
        }
    }
    
    var brain = CalculateBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathmaticalSymbol)
        }
        displayValue = brain.result
    }
    
    @IBAction func save() {
        savedProgram = brain.program
    }
    
    @IBAction func restore() {
        if savedProgram != nil{
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
}

