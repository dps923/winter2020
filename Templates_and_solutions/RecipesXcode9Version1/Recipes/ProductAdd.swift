//
//  ProductAdd.swift
//  Purpose - Handles the "add item" workflow
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Example method implementations are at the bottom of this file

import UIKit

protocol AddProductDelegate: class {
    
    func addTaskDidCancel(_ controller: UIViewController)
    
    func addTask(_ controller: UIViewController, didSave item: Product)
    // In general, the item type is suggested as Any, which you can cast, or...
    // Recommendation - change the type to match the actual item type
}

class ProductAdd: UIViewController {
    
    // MARK: - Instance variables
    
    weak var delegate: AddProductDelegate?
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productMaker: UITextField!
    @IBOutlet weak var productCost: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Make the productName text field active and show the keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productName.becomeFirstResponder()
    }
    
    // MARK: - Actions (user interface)
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Call into the delegate
        delegate?.addTaskDidCancel(self)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        view.endEditing(false)
        errorMessage.text?.removeAll()
        
        // Validate the data before saving
        
        if productName.text!.isEmpty {
            errorMessage.text = "Invalid product name"
            return
        }
        
        if productMaker.text!.isEmpty {
            errorMessage.text = "Invalid maker name"
            return
        }
        
        if productCost.text!.isEmpty {
            errorMessage.text = "Invalid cost"
            return
        }
        
        // Check numeric value too
        var cost: Double = 0.0
        // Attempt to get the numeric value
        if let value = Double(productCost.text!) {
            // Yes, successful, save it for later
            cost = value
            // Make one more check, must be a number that makes sense
            if value <= 0.0 {
                errorMessage.text = "Invalid cost"
                return
            }
        }
        
        // If we are here, the data passed the validation tests
        
        // Make an object
        let newItem = Product(name: productName.text!, maker: productMaker.text!, cost: cost)
        
        // Tell the user what we're doing
        errorMessage.text = "Attempting to save..."
        
        // Call into the delegate
        delegate?.addTask(self, didSave: newItem)
    }
    
}

// Example method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
// Storyboard scene needs a "Cancel" bar button on left side
// Connect it to this method...
func addTaskDidCancel(_ controller: UIViewController) {
    
    dismiss(animated: true, completion: nil)
}

// Storyboard scene needs a "Save" bar button on right side
// Connect it to this method...
func addTask(_ controller: UIViewController, didSave item: Product) {
    // In general, the item type is suggested as Any, which you can cast, or...
    // Recommendation - change the type to match the actual item type
    
    // Attempt to save the new product
    if m.productAdd(item) != nil {
        
        dismiss(animated: true, completion: nil)
    }
}
*/
