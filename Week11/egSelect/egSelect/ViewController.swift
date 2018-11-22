//
//  ViewController.swift
//  egSelect
//

import UIKit

// Adopt the select protocol
class ViewController: UIViewController, SelectExampleDelegate {

    // MARK: - Instance variables
    
    var m: DataModelManager!

    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var itemSelected: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "egSelect app"
    }

    // MARK: - Delegate methods
    
    func selectTaskDidCancel(_ controller: UIViewController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // Use the correct type for the "item"
    func selectTask(_ controller: UIViewController, didSelect item: String) {
        
        // Do something with the item
        itemSelected.text = item
        
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toExampleSelectList" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is embedded in a new navigation controller
            // so we must go through it
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! ExampleSelectList
            
            // Fetch and prepare the data to be passed on
            //let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            //let selectedData = frc.object(at: indexPath!)
            
            // Set other properties
            //vc.item = selectedData
            vc.title = "Select a colour"
            // Pass on the data model manager, if necessary
            vc.m = m
            // Set the delegate, if configured
            vc.delegate = self
        }
    }

}

