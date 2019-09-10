//
//  ViewController.swift
//  W01a2BtnLabel
//
//  Created by Peter McIntyre on 2019-09-10.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables
    
    var labelText = "App"
    var buttonTaps = 0

    // Outlets
    
    @IBOutlet weak var topLabel: UILabel!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the label text
        topLabel.text = labelText
        //topLabel.text = setLabelText(text: "Peter's")
    }

    // New function
    func setLabelText(text: String) -> String {
        return "This is \(text) \(labelText)"
    }

    // Actions
    
    
    @IBAction func updateLabel(_ sender: UIButton) {

        // Update button title
        buttonTaps += 1
        sender.setTitle("Update (tapped \(buttonTaps)x)", for: .normal)

        // Append text to the label
        topLabel.text = topLabel.text! + " app"

        // Check label text length
        if topLabel.text!.count > 30 {
            topLabel.text = "App"
        }
        
    }
    
}

