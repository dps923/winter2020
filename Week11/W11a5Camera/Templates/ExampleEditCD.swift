//
//  ExampleEditCD.swift
//  Purpose - Handles the "edit item" workflow
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit

protocol EditExampleDelegate: class {
    
    func editTaskDidCancel(_ controller: UIViewController)
    
    func editTaskDidSave(_ controller: UIViewController)
}

class ExampleEditCD: UIViewController {
    
    // MARK: - Instance variables
    
    weak var delegate: EditExampleDelegate?
    
    var m: DataModelManager!
    var item: Example!
    
    // MARK: - Outlets (user interface)

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var exampleName: UITextField!
    @IBOutlet weak var exampleQuantity: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the values into the user interface
        exampleName.text = item.name
        exampleQuantity.text = String(item.quantity)
    }

    // Make the first/desired text field active and show the keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        exampleName.becomeFirstResponder()
    }
    
    // MARK: - Actions (user interface)
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Call into the delegate
        delegate?.editTaskDidCancel(self)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        view.endEditing(false)
        errorMessage.text?.removeAll()
        
        // Validate the data before saving
        
        if exampleName.text!.isEmpty {
            errorMessage.text = "Invalid name"
            return
        }
        
        if exampleQuantity.text!.isEmpty {
            errorMessage.text = "Invalid quantity"
            return
        }
        
        // Check numeric value too
        var quantity: Int = 0
        // Attempt to get the numeric value
        if let value = Int(exampleQuantity.text!) {
            // Yes, successful, save it for later
            quantity = value
            // Make one more check, must be a number that makes sense
            if value <= 0 {
                errorMessage.text = "Invalid quantity"
                return
            }
        }
        
        // If we are here, the data passed the validation tests
        
        // Update the object, configure and save
        item.name = exampleName.text
        item.quantity = Int32(quantity)
        m.ds_save()

        // Tell the user what we're doing
        errorMessage.text = "Attempting to save..."
        
        // Call into the delegate
        delegate?.editTaskDidSave(self)
    }

}

// Sample delegate method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
 func editTaskDidCancel(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 
 func editTaskDidSave(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 */
