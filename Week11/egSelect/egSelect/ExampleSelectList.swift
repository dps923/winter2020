//
//  ExampleSelectList.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Intended for use as an item picker, presented modally
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit

protocol SelectExampleDelegate: class {
    
    func selectTaskDidCancel(_ controller: UIViewController)
    
    // Use the correct type for the "item" - change from "Any"
    func selectTask(_ controller: UIViewController, didSelect item: String)
}

class ExampleSelectList: UITableViewController {
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    var colours = [String]()
    
    weak var delegate: SelectExampleDelegate?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        colours = m.example_GetAll()
    }
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Call into the delegate
        delegate?.selectTaskDidCancel(self)
    }
    
    // MARK: - Table view methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     
     // Configure the cell...
     cell.textLabel?.text = colours[indexPath.row]
        
     return cell
     }

    // Responds to a row selection event
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Work with the selected item
        if let selectedCell = tableView.cellForRow(at: indexPath) {
            
            // Show a check mark
            selectedCell.accessoryType = .checkmark
            
            // Fetch the data for the selected item
            let data = colours[indexPath.row]
            
            // Call back into the delegate
            delegate?.selectTask(self, didSelect: data)
        }
    }


}

// Sample delegate method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
 func selectTaskDidCancel(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 
 // Use the correct type for the "item"
 func selectTask(_ controller: UIViewController, didSelect item: Any) {
 
 // Do something with the item
 
 dismiss(animated: true, completion: nil)
 }
 */
