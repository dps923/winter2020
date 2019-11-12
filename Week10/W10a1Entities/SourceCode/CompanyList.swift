//
//  CompanyList.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit
import CoreData

class CompanyList: ListBaseCD {
    
    // MARK: - Private internal instance variables
    
    // Configure the desired entity type in the frc
    private var frc: NSFetchedResultsController<Company>!
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure nav items
        title = "Companies"
        
        // Diagnostic
        /*
         let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
         let count = try? m.ds_context.count(for: fetchRequest)
         print("\(count ?? 0) companies")
         */
        
        // Configure the frc for the desired entity type, sort is case-sensitive
        frc = m.ds_frcForEntityNamed("Company", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], andSectionNameKeyPath: nil)
        
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
    
    // Numbe of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.frc.sections?.count ?? 0
    }
    
    // What is the section title?
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // Get a reference to the section object in the frc
        // And make sure there is a section name
        if let s = self.frc.sections?[section], s.name.count > 0 {
            return "Your custom section prompt \(s.name)"
        }
        return nil
    }
    
    // Number of rows in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.frc.sections?[section].numberOfObjects ?? 0
    }
    
    // Render the table view cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        let item = frc.object(at: indexPath) 
        cell.textLabel!.text = item.name
        
        // Build the detail text label content
        let numEmpl = item.employees?.count
        let numProd = item.products?.count
        cell.detailTextLabel?.text = "\(item.country!), \(numEmpl!) employees, \(numProd!) products"
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCompanyScene" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! CompanyScene
            
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = frc.object(at: indexPath!)
            
            // Set other properties
            vc.item = selectedData
            vc.title = selectedData.name
            // Pass on the data model manager, if necessary
            vc.m = m
        }
    }
    
}
