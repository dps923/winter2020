//
//  ExampleSelectCD.swift
//  Purpose - Shows content for an item selection list
//  This is a table view controller, modally-presented
//
//  Data for the list will come from a fetch request or an frc

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit
import CoreData

protocol ExampleSearchCDDelegate: class {
    
    func searchTaskDidCancel(_ controller: UIViewController)
    
    // Change the data type of the "item" to match your needs
    func searchTask(_ controller: UIViewController, didSelect item: Example)
}

class ExampleSelectCD: ListBaseCD {

    // MARK: - Internal instance variables
    
    weak var delegate: ExampleSearchCDDelegate?

    // Configure the desired entity type in the frc
    private var frc: NSFetchedResultsController<Example>!
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    // Passed-in object, if necessary
    //var item: Example!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure nav items
        title = "Examples"
        
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
            return "Your custom prompt \(s.name)"
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
        cell.detailTextLabel?.text = "Quantity is \(item.quantity)"
        
        return cell
    }

    // Handle row tap action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Work with the selected item
        if let selectedCell = tableView.cellForRow(at: indexPath) {
            
            // Show a check mark
            selectedCell.accessoryType = .checkmark
            
            // Fetch the data for the selected item
            let selectedData = frc.object(at: indexPath)
            
            // Call back into the delegate
            delegate?.searchTask(self, didSelect: selectedData)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
