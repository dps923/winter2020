//
//  MainMenu.swift
//  Purpose - Acts as a main menu for the app
//

import UIKit

class MainMenu: UIViewController {

    // MARK: - Instance variables
    
    var m: DataModelManager!
    
    // MARK: - User interface outlets
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Web API examples"
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Add "if" blocks to cover all the possible segues
        // One for each workflow (navigation) or task segue
        
        // A workflow segue is managed by the current nav controller
        // A task segue goes to a scene that's managed by a NEW nav controller
        // So there's a difference in how we get a reference to the next controller
        
        if segue.identifier == "toChinookCustomerList" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ChinookCustomerList
            
            // Set other properties
            vc.title = "Chinook Customers"
            // Pass on the data model manager, if necessary
            vc.m = m
        }

        if segue.identifier == "toChinookCustomer" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ChinookCustomerScene
            
            // Set other properties
            vc.title = "Chinook Customer"
            // Pass on the data model manager, if necessary
            vc.m = m
        }

        if segue.identifier == "toChinookCustomerWithEmployee" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ChinookCustomerWithEmployeeScene
            
            // Set other properties
            vc.title = "Chinook Customer & Employee"
            // Pass on the data model manager, if necessary
            vc.m = m
        }

        if segue.identifier == "toSICTEmployeeList" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! SICTEmployeeList
            
            // Set other properties
            vc.title = "SICT Employees"
            // Pass on the data model manager, if necessary
            vc.m = m
        }

        if segue.identifier == "toSICTEmployeeId4Scene" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! SICTEmployeeScene
            
            // Set other properties
            vc.title = "Employee & reporting"
            // Pass on the data model manager, if necessary
            vc.m = m
            // Pass on the employee identifier
            vc.employeeId = 4
        }

        if segue.identifier == "toSICTEmployeeId1Scene" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! SICTEmployeeScene
            
            // Set other properties
            vc.title = "Employee all data"
            // Pass on the data model manager, if necessary
            vc.m = m
            // Pass on the employee identifier
            vc.employeeId = 1
        }

        // Sample workflow segue code...
        /*
         if segue.identifier == "toWorkflowScene" {
         
         // Your customized code goes here,
         // but here is some sample/starter code...
         
         // Get a reference to the next controller
         // Next controller is managed by the current nav controller
         let vc = segue.destination as! FoodItemScene
         // Alternative... next controller is a table view controller
         //let vc = segue.destination as! FoodItemList
         
         // Fetch and prepare the data to be passed on
         let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
         let selectedData = frc.object(at: indexPath!)
         
         // Set other properties
         vc.item = selectedData
         vc.title = selectedData.name
         // Pass on the data model manager, if necessary
         //vc.m = m
         // Set the delegate, if configured
         //vc.delegate = self
         }
         */
        
        // Sample task segue code...
        /*
         if segue.identifier == "toTaskScene" {
         
         // Your customized code goes here,
         // but here is some sample/starter code...
         
         // Get a reference to the next controller
         // Next controller is embedded in a new navigation controller
         // so we must go through it
         let nav = segue.destination as! UINavigationController
         let vc = nav.viewControllers[0] as! FoodItemDetail
         
         // Fetch and prepare the data to be passed on
         let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
         let selectedData = frc.object(at: indexPath!)
         
         // Set other properties
         vc.item = selectedData
         vc.title = selectedData.name
         // Pass on the data model manager, if necessary
         //vc.m = m
         // Set the delegate, if configured
         //vc.delegate = self
         }
         */
        
    }

}

