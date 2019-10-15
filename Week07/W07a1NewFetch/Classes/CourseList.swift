//
//  CourseList.swift
//  W07a1NewFetch
//
//  Created by Peter McIntyre on 2019-10-09.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class CourseList: UITableViewController {
    
    // MARK: - Variables
    
    var m: DataModelManager!
 
    // MARK: - Outlets

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Listen for a notification that new data is available for the list
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("WebApiDataIsReady"), object: nil)

        // Fetch the data
        m.courseGetAll()
    }

    // Method that runs when the notification happens
    @objc func reloadTableView() {
        tableView.reloadData()
    }
    
    // Build table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Build table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m.courses.count
    }
    
    // Build table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        // Configure the cell...        
        cell.textLabel?.text = m.courses[indexPath.row].courseCode
        cell.detailTextLabel?.text = m.courses[indexPath.row].courseName
        
        return cell
    }
    
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCourseScene" {
            
            // Get a reference to the next controller
            let vc = segue.destination as? CourseScene
            
            // Extract the data from the data source
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = m.courses[indexPath!.row]
            
            // Pass it on to the next controller
            vc?.course = selectedData
        }
    }
    
}
