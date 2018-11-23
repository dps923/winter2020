//
//  SICTEmployeeList.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit

class SICTEmployeeList: UITableViewController {

    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SICT Employees"
        
        // Listen for a notification that new data is available for the list
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("WebApiDataIsReady"), object: nil)
        
        // Get the data
        m.sict_employees_GetAll()
    }

    // Method that runs when the notification happens
    @objc func reloadTableView() {
        tableView.reloadData()
    }
    
    // MARK: - Table view methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m.sictEmployees.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let data = m.sictEmployees[indexPath.row]
        
        // Build the name info
        cell.textLabel?.text = "\(data.LastName), \(data.FirstName)"

        return cell
    }

}
