//
//  ViewController.swift
//  ISCG7436 Calculator
//
//  Created by Jayson Jury on 23/09/19.
//  Copyright © 2019 Jayson Jury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    
    //Variables
    var previousNumber: Double = 0
    var screenNumber: Double = 0
    var operation = 0
    var performingOperation: Bool = false
    //numberStore
    //screenNumbers
    //NumericalOperators
    // tag what is pressed on screen
    // performing operation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //resultLabel.text = " it is working" // Testing label output
        resultLabel.text = ""
    }
    //IBActions
    @IBAction func numberPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        // '.' is tag(16)
        if tag == 16{
            resultLabel.text = resultLabel.text! + "."
        } else{
        if performingOperation == true {
            performingOperation = false
            resultLabel.text = String(tag-1)
            screenNumber = Double(resultLabel.text!)!
            }else{
            resultLabel.text = resultLabel.text! + String(tag - 1)
            screenNumber = Double(resultLabel.text!)!
        }
        }
        //TODO: need to create the decimal point for the number action
        //Linked to the operator action need to unlink and cretae if statement at start to append a '.' to resultLabel
       // '.' is tag(16)
        //resultLabel.text = resultLabel.text! + String(tag - 1)
    }
    
    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        // clear button 17
        if tag == 17{
            resultLabel.text = ""
            previousNumber = 0
            screenNumber = 0
            operation = 0
            return
        }
        
        /* operations +(tag 14) -(tag 13) /(tag 11) *(tag 12) */
        if tag == 11 {
            performingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "/"
            operation = 11
            }else if tag == 12 {
            performingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "*"
            operation = 12
            
        }else if tag == 13{
            performingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "-"
            operation = 13
        }else if tag == 14{
            performingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "+"
            operation = 14
        }else if tag == 15{
            // get the operator tag number from previous
            
            if operation == 11{
                if screenNumber == 0{
                    resultLabel.text = "error cannot / by 0"
                }else {
                     resultLabel.text = String(previousNumber / screenNumber)
                }
               } else if operation == 12{
                resultLabel.text = String(previousNumber * screenNumber)
            }else if operation == 13 {
                resultLabel.text = String(previousNumber - screenNumber)
            }else if operation == 14{
                resultLabel.text = String(previousNumber + screenNumber)
                
            }
            
        }
}

}
