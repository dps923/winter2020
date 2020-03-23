//
//  ExampleList.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit
import CoreData

class ExampleList: ListBaseCD, ExampleAddDelegate {
    
    // MARK: - Private internal instance variables
    
    // Configure the desired entity type in the frc
    private var frc: NSFetchedResultsController<Example>!
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure nav items
        title = "Examples"
        // If desired, configure the table view edit capability
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Configure the frc for the desired entity type, sort is case-insensitive
        frc = m.ds_frcForEntityNamed("Example", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: [NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))], andSectionNameKeyPath: nil)
        
        // This controller will be the frc delegate
        frc.delegate = self;
        
        // Perform fetch, and if there's an error, log it
        do {
            try frc.performFetch()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Actions (user interface)
    
    func addTaskDidCancel(_ controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addTaskDidSave(_ controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Disable the right bar button (the + "Add" button) during table edits
    override func setEditing(_ editing: Bool, animated: Bool) {
        // Must call super, then set the right bar button state
        super.setEditing(editing, animated: animated)
        navigationItem.rightBarButtonItem?.isEnabled = !isEditing
    }
    
    // MARK: - Table view building

    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.frc.sections?.count ?? 0
    }

    // Number of rows in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.frc.sections?[section].numberOfObjects ?? 0
    }
    
    // Render cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        let item = frc.object(at: indexPath) 
        cell.textLabel!.text = item.name
        cell.detailTextLabel?.text = "Quantity is \(item.quantity)"
        if let photo = item.photo {
            cell.imageView?.image = UIImage(data: photo)
        }
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            let item = frc.object(at: indexPath)
            m.example_DeleteItem(item: item)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // To the more info scene
        if segue.identifier == "toExampleScene" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ExampleScene
            
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = frc.object(at: indexPath!)
            
            // Set other properties
            vc.item = selectedData
            vc.title = selectedData.name
            // Pass on the data model manager, if necessary
            //vc.m = m
        }
        
        // To the add new scene, modally presented
        if segue.identifier == "toExampleAddNew" {
            
            // Get a reference to the next controller
            // Next controller is embedded in a new navigation controller
            // so we must go through it
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! ExampleAddNew
            
            // Set other properties
            vc.title = "Add new item"
            // Pass on the data model manager, if necessary
            vc.m = m
            // Set the delegate, if configured
            vc.delegate = self
        }
    }
    
}
