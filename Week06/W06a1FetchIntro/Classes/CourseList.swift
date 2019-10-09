//
//  CourseList.swift
//  W06a1FetchIntro
//
//  Created by Peter McIntyre on 2019-10-09.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class CourseList: UITableViewController {
    
    // MARK: - Variables
    
    var items = [Course]()
    
    // MARK: - Outlets
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch the data
        fetchData()
    }
    
    // Fetch data from the web API
    private func fetchData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/your-account/repo-name/master/path-to/data.json")!
        
        // Create (define) a task; remember that we are just defining it
        // After the multi-line statement executes, "task" exists,
        // but it is in a "suspended" state
        
        // The task requires a callback parameter, which is a Swift closure
        // When the task completes, it will call the closure (function),
        // and pass some arguments; all three are optional; see the docs...
        // https://developer.apple.com/documentation/foundation/urlsession/1410330-datatask
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Do two checks BEFORE attempting to extract the data from the response
            // 1. Check whether an "error" object was passed in
            // 2. Check that the HTTP response status is what we expect
            
            // If there is an error, then "error" will have something in it
            // Otherwise, it will be nil
            if let error = error {
                print(error)
                return
            }
            
            // We want to ensure that we have a good HTTP response status
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
                else {
                    print(response?.url?.path ?? "Status code error")
                    return
            }
            
            // If we're here, we can get started on
            // extracting the data from the response
            
            // Ensure that three conditions are met (multiple if-let)...
            // 1. Non-nil Content-Type header
            // 2. Content-Type starts with "text/plain"
            // 3. Data is non-nil
            if let mimeType = httpResponse.mimeType,
                mimeType.starts(with: "text/plain"),
                let data = data {
                
                // Create and configure a JSON decoder
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                // Attempt to decode the data into a "PackageCourses" object
                do {
                    let result = try decoder.decode(CoursePackage.self, from: data)
                    
                    // Diagnostic
                    print(result.student)
                    
                    // Save the data (in memory)
                    self.items = result.data
                    // Then reload the table view; must be done this way
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch {
                    print(error)
                }
            }
        }
        
        // Now that "task" has been fully defined, execute it...
        task.resume()
    }
    
    // Build table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Build table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Build table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row].courseCode
        cell.detailTextLabel?.text = items[indexPath.row].courseName
        
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
            let selectedData = items[indexPath!.row]
            
            // Pass it on to the next controller
            vc?.course = selectedData
        }
    }
    
}
