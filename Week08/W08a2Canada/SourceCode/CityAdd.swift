//
//  CityAdd.swift
//  Purpose - Handles the "add item" workflow
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit

protocol AddCityDelegate: class {
    
    func addTaskDidCancel(_ controller: UIViewController)
    
    func addTaskDidSave(_ controller: UIViewController)
}

class CityAdd: UIViewController {
    
    // MARK: - Instance variables
    
    weak var delegate: AddCityDelegate?
    
    var m: DataModelManager!
    
    // Need the parent object
    
    var relatedItem: Province!
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var cityMayor: UITextField!
    @IBOutlet weak var cityPopulation: UITextField!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add \(relatedItem.name!) city"
    }
    
    // Make the first/desired text field active and show the keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cityName.becomeFirstResponder()
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
        
        if cityName.text!.isEmpty {
            errorMessage.text = "Invalid name"
            return
        }
        
        if cityMayor.text!.isEmpty {
            errorMessage.text = "Invalid mayor name"
            return
        }

        if cityPopulation.text!.isEmpty {
            errorMessage.text = "Invalid population"
            return
        }

        // Check numeric value too
        var population: Int = 0
        // Attempt to get the numeric value
        if let value = Int(cityPopulation.text!) {
            // Yes, successful, save it for later
            population = value
            // Make one more check, must be a number that makes sense
            if value <= 0 {
                errorMessage.text = "Invalid population"
                return
            }
        }
        
        // If we are here, the data passed the validation tests
        
        // Tell the user what we're doing
        errorMessage.text = "Attempting to save..."
        
        // Make an object, configure and save
        if let newItem = m.city_CreateItem() {
            
            newItem.name = cityName.text
            newItem.mayor = cityMayor.text
            newItem.population = Int32(population)

            // Set the related object
            newItem.province = relatedItem
            
            m.ds_save()
        }

        // Call into the delegate
        delegate?.addTaskDidSave(self)
    }
    
}

// City delegate method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
 func addTaskDidCancel(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 
 func addTaskDidSave(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 */
