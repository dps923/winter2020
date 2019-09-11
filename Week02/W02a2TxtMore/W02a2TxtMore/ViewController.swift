//
//  ViewController.swift
//  W02a2TxtMore
//
//  Created by Peter McIntyre on 2019-09-11.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Variables
    
    // Outlets
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var ageResult: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    
    @IBOutlet weak var updateResult: UILabel!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the "Age..." label
        ageResult.text = "Age (\(ageSlider.value.rounded()))"
        
        // Set the delegates in code statements
        firstName.delegate = self
        lastName.delegate = self
        
        // Alternatively, can set them in the
        // Interface Builder visual editor
    }

    // What happens when the user taps in a text field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // Here, we want to know which text field is being edited
        // We do this by comparing the references
        // Match the passed-in "textField" with
        // the outlets we defined above
        
        switch textField {
        // Are we editing the "firstName" text field?
        case firstName:
            print("Editing first name text field")
        // Are we editing the "lastName" text field?
        case lastName:
            print("Editing last name text field")
        default:
            print("nothing")
        }
    }
    
    // What happens when they on-screen keyboard
    // "return" (or "Done" or whatever) is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    // Actions
    
    // Handle the slider value change
    @IBAction func ageChanged(_ sender: UISlider) {

        ageResult.text = "Age (\(sender.value.rounded()))"
    }
    
    // Handle the button tap
    @IBAction func updateAll(_ sender: UIButton) {
        
        // Update the result string
        updateResult.text = "\(firstName.text!.uppercased()) \(lastName.text!.uppercased()) is age \(ageSlider.value.rounded())"
    }
    
}

