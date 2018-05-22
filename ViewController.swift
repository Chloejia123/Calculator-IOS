//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Yi Jia on 5/21/18.
//  Copyright © 2018 Chloe Jia. All rights reserved.
//

import UIKit
enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLb1: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLb1.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            outputLb1.text = runningNumber
        }
    }
    @IBAction func clearPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        currentOperation = .NULL
        outputLb1.text = "0"
        
    }
    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 7 && !runningNumber.contains("."){
            runningNumber += "."
            outputLb1.text = runningNumber
        }
    }
    @IBAction func equalPressed(_ sender: UIButton) {
        operaton(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operaton(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        operaton(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operaton(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operaton(operation: .Divide)
    }
    
    func operaton(operation: Operation){
        if currentOperation != .NULL{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add{
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLb1.text = result
            }
            currentOperation = operation
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

