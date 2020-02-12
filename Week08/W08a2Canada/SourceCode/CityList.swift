//
//  CityList.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit
import CoreData

// Adopt the protocols that are appropriate for this controller
// For example... detail, add, edit, add+edit

class CityList: ListBaseCD, AddCityDelegate {
    
    // MARK: - Private internal instance variables
    
    // Configure the desired entity type in the frc
    private var frc: NSFetchedResultsController<City>!
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    // Passed-in object, if necessary
    //var item: City!
    // Passed-in parent-of-collection object, if necessary
    var item: Province!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure nav items
        //title = "Cities"
        title = "Cities in \(item.name!)"
        // If desired, configure the table view edit capability
        navigationItem.rightBarButtonItems?.append(editButtonItem)
        
        // Predicate string
        let predicate = "province == %@"
        
        // Configure the frc for the desired entity type, sort is case-insensitive
        frc = m.ds_frcForEntityNamed("City", withPredicateFormat: predicate, predicateObject: [item], sortDescriptors: [NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))], andSectionNameKeyPath: nil)
        
        // Alternative, case-sensitive
        //frc = m.ds_frcForEntityNamed("City", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], andSectionNameKeyPath: nil)
        
        // This controller will be the frc delegate
        frc.delegate = self;
        
        // Perform fetch, and if there's an error, log it
        do {
            try frc.performFetch()
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func addTaskDidCancel(_ controller: UIViewController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func addTaskDidSave(_ controller: UIViewController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions (user interface)
    
    // Disable the right bar button (the + "Add" button) during table edits
    override func setEditing(_ editing: Bool, animated: Bool) {
        // Must call super, then set the right bar button state
        super.setEditing(editing, animated: animated)
        // This is a new situation...
        // There are TWO right-side bar button items
        // We want to enable the original one from the storyboard
        navigationItem.rightBarButtonItems?.first!.isEnabled = !isEditing
    }

    // MARK: - Table view building
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.frc.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.frc.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = frc.object(at: indexPath) 
        cell.textLabel!.text = item.name
        cell.detailTextLabel?.text = "Population is \(item.population)"
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            let item = frc.object(at: indexPath)
            m.city_DeleteItem(item: item)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Add "if" blocks to cover all the possible segues
        // One for each workflow (navigation) or task segue
        
        // A workflow segue is managed by the current nav controller
        // A task segue goes to a scene that's managed by a NEW nav controller
        // So there's a difference in how we get a reference to the next controller
        
        if segue.identifier == "toCityAdd" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is embedded in a new navigation controller
            // so we must go through it
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! CityAdd
            
            // Fetch and prepare the data to be passed on
            //let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            //let selectedData = frc.object(at: indexPath!)
            
            // Set other properties
            //vc.item = selectedData
            //vc.title = selectedData.name
            vc.relatedItem = item
            // Pass on the data model manager, if necessary
            vc.m = m
            // Set the delegate, if configured
            vc.delegate = self
        }
        
        if segue.identifier == "toCitySceneV1" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! CitySceneV1
            // Alternative... next controller is a table view controller
            //let vc = segue.destination as! ProductList
            
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
        
        // City workflow segue code...
        /*
         if segue.identifier == "toWorkflowScene" {
         
         // Your customized code goes here,
         // but here is some sample/starter code...
         
         // Get a reference to the next controller
         // Next controller is managed by the current nav controller
         let vc = segue.destination as! ProductScene
         // Alternative... next controller is a table view controller
         //let vc = segue.destination as! ProductList
         
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
        
        // City task segue code...
        /*
         if segue.identifier == "toTaskScene" {
         
         // Your customized code goes here,
         // but here is some sample/starter code...
         
         // Get a reference to the next controller
         // Next controller is embedded in a new navigation controller
         // so we must go through it
         let nav = segue.destination as! UINavigationController
         let vc = nav.viewControllers[0] as! CityDetailCD
         
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
