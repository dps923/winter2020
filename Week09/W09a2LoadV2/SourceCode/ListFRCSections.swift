//
//  ListFRCSections.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit
import CoreData

class ListFRCSections: ListBaseCD {
    
    // MARK: - Private internal instance variables
    
    // Configure the desired entity type in the frc
    private var frc: NSFetchedResultsController<Person>!
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    // This value is passed in, if desired
    var sectionName: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure nav items
        title = "Persons"
        
        // Configure the frc for the desired entity type
        
        // Notice the usage of the "andSectionNameKeyPath"
        // It could have a value, or it could be nil
        // That is set/configured in the LaunchScene in the prepare-for-nav method
        
        frc = m.ds_frcForEntityNamed("Person", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: [NSSortDescriptor(key: "province", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:))), NSSortDescriptor(key: "city", ascending: true)], andSectionNameKeyPath: sectionName)
        
        // This controller will be the frc delegate
        frc.delegate = self;
        
        // Perform fetch, and if there's an error, log it
        do {
            try frc.performFetch()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Table view building
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.frc.sections?.count ?? 0
    }
    
    // What is the section title?
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // Get a reference to the section object in the frc
        // And make sure there is a section name
        if let s = self.frc.sections?[section], s.name.count > 0 {
            return "Persons in \(s.name)"
        }
        return nil
    }
    
    // Number of rows in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.frc.sections?[section].numberOfObjects ?? 0
    }
    
    // Render a table view cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = frc.object(at: indexPath)
        cell.textLabel!.text = "\(item.firstName!) \(item.lastName!)"
        cell.detailTextLabel?.text = "\(item.city!), \(item.province!)"
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPersonScene" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! PersonScene
            
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = frc.object(at: indexPath!)
            
            // Set other properties
            vc.item = selectedData
            // Pass on the data model manager, if necessary
            vc.m = m
        }
    }
    
}
