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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //resultLabel.text = " it is working" // Testing label output
    }
    //IBActions
    @IBAction func numberPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        
        resultLabel.text = String(tag - 1)
    }
    
}

