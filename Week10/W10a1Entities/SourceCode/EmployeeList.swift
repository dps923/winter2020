//
//  EmployeeList.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit
import CoreData

class EmployeeList: ListBaseCD {
    
    // MARK: - Private variables
    
    // Declare a photo cache container
    // It will be a dictionary that holds image data
    // and a unique key (for example, a URL)
    private var photoCache = [String: Data]()
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    var items: [Employee]!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure nav and row height items
        title = "Employees"
        tableView.rowHeight = 70.0
    }
    
    // MARK: - Table view building
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Render the cell content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel!.text = item.name
        cell.detailTextLabel?.text = item.title
        
        // Set image content mode
        cell.imageView?.contentMode = .left
        
        // Load a placeholder image
        cell.imageView?.image = UIImage(named: "placeholder.png")
        
        // Attempt to load from the local photo cache
        if let imageData = photoCache[item.photo!] {
            // Diagnostic
            //print("Photo cache has the photo")
            
            // Configure its size
            // (Logic problem? Why do we need to do this? To be researched...)
            let image = ImageHandling.makeThumbnail(from: UIImage(data: imageData)!, size: CGSize(width: 50, height: 50))
            cell.imageView?.image = image
        }
        else {
            // Must fetch the photo from the network
            
            // Fix for this code example only
            let url = item.photo?.replacingOccurrences(of: "http:", with: "https:")
            
            // Diagnostic
            //print("Will attempt to fetch \(url)")
            
            // Attempt to load from the web
            // If using the signature with "completionHandler",
            // must create a data task variable
            // Otherwise, cannot use the trailing closure form,
            // and then execute the task right away with ".resume()"
            
            let photoFetch = URLSession.shared.dataTask(with: URL(string: url!)!, completionHandler: { (data, response, error) in
                
                // Continue only if the response is an image
                guard let mimeType = response?.mimeType, mimeType.starts(with: "image/") else { return }
                
                // Continue only if data was returned
                if let imageData = data {
                    // Remember, we're inside a closure function
                    // So we must access the main thread to update the UI
                    DispatchQueue.main.async {
                        
                        // Make a thumbnail
                        let image = ImageHandling.makeThumbnail(from: UIImage(data: imageData)!, size: CGSize(width: 50, height: 50))
                        cell.imageView?.image = image
                        
                        // Add to the photo cache
                        self.photoCache[item.photo!] = image?.pngData()
                        // Diagnostic
                        //print("Photo cache now has \(self.photoCache.count) items")
                    }
                }
            })
            photoFetch.resume()
            
        }
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEmployeeScene" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! EmployeeScene
            
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = items![(indexPath?.row)!]
            
            // Set other properties
            vc.item = selectedData
            vc.title = "Employee info"
            // Pass on the data model manager, if necessary
            //vc.m = m
        }
    }
    
}
