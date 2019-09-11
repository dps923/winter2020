//
//  CityList.swift
//  W02a4TableView
//
//  Created by Peter McIntyre on 2019-09-11.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class CityList: UITableViewController {

    // Variables
    
    // Static data in this controller
    // In the future (but soon), we will use a "model object"
    // to provide and manage the app's data
    let cities = [
        "Ottawa", "Kingston", "Belleville", "Peterborough",
        "GTA East", "Toronto", "York Region", "Brampton",
        "Mississauga", "GTA West", "Hamilton", "Niagara Region",
        "Waterloo Region", "London", "Windsor"
    ]

    // The index path (section number and row number)
    // that currently has the check mark "accessory"
    var checkedRow: IndexPath?
    
    // Outlets
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Table view title
        title = "My City"
    }

    // How many "sections" in the table view?
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // How many "rows" in each section?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    // The iOS runtime calls this once for EACH item in the data source
    // Configure the content of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Important note... use "default" as the name of the identifier
        // Also, match this to the name/value used in the
        // "Prototype Cells" attributes inspector ("Identifier" setting)
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = cities[indexPath.row]

        return cell
    }

    // The iOS runtime calls this whenever the user taps on a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // First, if a previous row was check-marked, clear it
        // Swift "if let" is a good way to prevent null/nil reference errors
        if let previouslyChecked = checkedRow {
            tableView.cellForRow(at: previouslyChecked)?.accessoryType = .none
        }
        
        // Then, check-mark the row, deselect the row, and remember it
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
        checkedRow = indexPath
    }

}
