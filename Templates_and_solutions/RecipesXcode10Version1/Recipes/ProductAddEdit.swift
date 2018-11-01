//
//  ProductAddEdit.swift
//  Purpose - Handles both the "add item" and "edit item" workflows
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Example method implementations are at the bottom of this file

import UIKit

protocol AddEditProductDelegate: class {
    
    func addEditTaskDidCancel(_ controller: UIViewController)
    
    func addTask(_ controller: UIViewController, didSave item: Product)
    // In general, the item type is suggested as Any, which you can cast, or...
    // Recommendation - change the type to match the actual item type
    
    func editTask(_ controller: UIViewController, didSave item: Product)
    // In general, the item type is suggested as Any, which you can cast, or...
    // Recommendation - change the type to match the actual item type
}

class ProductAddEdit: UIViewController {
    
    // MARK: - Instance variables
    
    weak var delegate: AddEditProductDelegate?
    
    var item: Product?
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productMaker: UITextField!
    @IBOutlet weak var productCost: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            
            // Load the values into the user interface
            productName.text = item.name
            productMaker.text = item.maker
            productCost.text = String(item.cost)
        }
    }
    
    // Make the productName text field active and show the keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productName.becomeFirstResponder()
    }
    
    // MARK: - Actions (user interface)
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Call into the delegate
        delegate?.addEditTaskDidCancel(self)
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
        
        // Tell the user what we're doing
        errorMessage.text = "Attempting to save..."
        
        // Update the object; determine whether this is an add or edit situation
        if let item = item {
            
            // It is an "edit" situation
            item.name = productName.text!
            item.maker = productMaker.text!
            item.cost = cost
            
            // Call into the delegate
            delegate?.editTask(self, didSave: item)
        }
        else {
            
            // It is an "add" situation
            
            // Create and configure a new item
            let newItem = Product(name: productName.text!, maker: productMaker.text!, cost: cost)
            
            // Call into the delegate
            delegate?.addTask(self, didSave: newItem)
        }
    }
    
}

// Example method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
// Storyboard scene needs a "Cancel" bar button on left side
// Connect it to this method...
func addEditTaskDidCancel(_ controller: UIViewController) {
    
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

// Storyboard scene needs a "Save" bar button on right side
// Connect it to this method...
func editTask(_ controller: UIViewController, didSave item: Product) {
    // In general, the item type is suggested as Any, which you can cast, or...
    // Recommendation - change the type to match the actual item type
    
    // Attempt to save the updated product
    if m.productEdit(item) != nil {
        
        // Update the user interface
        self.item = item
        self.title = item.name
        productName.text = item.name
        
        dismiss(animated: true, completion: nil)
    }
}
*/
