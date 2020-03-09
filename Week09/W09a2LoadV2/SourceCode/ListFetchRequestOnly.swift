//
//  ListFetchRequestOnly.swift
//  W09a2LoadV2
//
//  Created by Peter McIntyre on 2019-11-10.
//  Copyright © 2019 SICT. All rights reserved.
//
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit
import CoreData

class ListFetchRequestOnly: ListBaseCD {
    
    // MARK: - Private internal instance variables
    
    // Fetch request results
    private var persons = [Person]()
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure nav items
        title = "Persons"
        
        // Create and configure a fetch request
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "province", ascending: true), NSSortDescriptor(key: "city", ascending: true)]
        
        // Attempt to run the fetch request
        do {
            let results = try m.ds_context.fetch(fetchRequest)
            persons = results
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Table view building
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return self.frc.sections?.count ?? 0
        return 1
    }
    
    // Number of rows in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.frc.sections?[section].numberOfObjects ?? 0
        return persons.count
    }
    
    // Render a table view cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        let item = persons[indexPath.row]
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
            let selectedData = persons[indexPath!.row]
            
            // Set other properties
            vc.item = selectedData
            // Pass on the data model manager, if necessary
            vc.m = m
        }
    }
    
}
