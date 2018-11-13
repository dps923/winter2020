//
//  ProvinceAdd.swift
//  Purpose - Handles the "add item" workflow
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Province method implementations are at the bottom of this file

import UIKit

protocol AddProvinceDelegate: class {
    
    func addTaskDidCancel(_ controller: UIViewController)
    
    func addTaskDidSave(_ controller: UIViewController)
}

class ProvinceAdd: UIViewController {
    
    // MARK: - Instance variables
    
    weak var delegate: AddProvinceDelegate?
    
    var m: DataModelManager!
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var provinceName: UITextField!
    @IBOutlet weak var provincePremier: UITextField!
    @IBOutlet weak var provinceArea: UITextField!
    @IBOutlet weak var provinceYearFounded: UITextField!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Make the first/desired text field active and show the keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        provinceName.becomeFirstResponder()
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
        
        if provinceName.text!.isEmpty {
            errorMessage.text = "Invalid name"
            return
        }
        
        if provincePremier.text!.isEmpty {
            errorMessage.text = "Invalid premier"
            return
        }

        if provinceArea.text!.isEmpty {
            errorMessage.text = "Invalid area"
            return
        }

        // Check numeric value too
        var area: Int = 0
        // Attempt to get the numeric value
        if let value = Int(provinceArea.text!) {
            // Yes, successful, save it for later
            area = value
            // Make one more check, must be a number that makes sense
            if value <= 0 {
                errorMessage.text = "Invalid area"
                return
            }
        }
        if provinceYearFounded.text!.isEmpty {
            errorMessage.text = "Invalid year founded"
            return
        }

        // Check numeric value too
        var yearFounded: Int = 0
        // Attempt to get the numeric value
        if let value = Int(provinceYearFounded.text!) {
            // Yes, successful, save it for later
            yearFounded = value
            // Make one more check, must be a number that makes sense
            if value <= 0 {
                errorMessage.text = "Invalid area"
                return
            }
        }
        
        // If we are here, the data passed the validation tests
        
        // Tell the user what we're doing
        errorMessage.text = "Attempting to save..."
        
        // Make an object, configure and save
        if let newItem = m.province_CreateItem() {
            
            newItem.name = provinceName.text
            newItem.premier = provincePremier.text
            newItem.area = Int32(area)
            newItem.yearFounded = Int32(yearFounded)
            m.ds_save()
        }

        // Call into the delegate
        delegate?.addTaskDidSave(self)
    }
    
}

// Province delegate method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
 func addTaskDidCancel(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 
 func addTaskDidSave(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 */
