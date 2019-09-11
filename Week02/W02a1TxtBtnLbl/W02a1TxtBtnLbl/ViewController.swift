//
//  ViewController.swift
//  W02a1TxtBtnLbl
//
//  Created by Peter McIntyre on 2019-09-11.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables

    // Outlets

    @IBOutlet weak var incomingText: UITextField!
    @IBOutlet weak var textResult: UILabel!

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the keyboard input focus
        incomingText.becomeFirstResponder()
    }

    // Actions

    @IBAction func updateView(_ sender: UIButton) {
        
        // Optional... transform to upper case
        textResult.text = incomingText.text!.uppercased()
        // Clear the incoming text field
        incomingText.text = ""
        
        // Dismiss the keyboard
        incomingText.resignFirstResponder()
    }
}

