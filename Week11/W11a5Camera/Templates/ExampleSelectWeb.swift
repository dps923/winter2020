//
//  ExampleSelectWeb.swift
//  Purpose - Shows content for an item selection list
//  This is a table view controller, modally-presented
//
//  Data for the list will come from a web API request

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit

protocol ExampleSearchWebDelegate: class {
    
    func searchTaskDidCancel(_ controller: UIViewController)
    
    // Change the data type of the "item" to match your needs
    func searchTask(_ controller: UIViewController, didSelect item: Country)
}

class ExampleSearchWebList: UITableViewController {
    
    // MARK: - Variables
    
    weak var delegate: ExampleSearchWebDelegate?
    
    var searchList: [Country]!
    var searchResult: Country?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the data for the list from a web API
        
        // Create a web API request
        let request = WebApiRequest()
        
        // Send it to a web API that has a "countries" resource
        // For this example, assume that it returns
        // an array of "Country" objects
        request.sendRequest(toUrlPath: "/countries", completion: { (result: [Country]) in
            self.searchList = result
            //dump(result)
            self.tableView.reloadData()
        })

    }
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Call into the delegate
        delegate?.searchTaskDidCancel(self)
    }
    
    // MARK: - Table view data source
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    // Render a table view row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        // Configure the cell...
        let item = searchList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Capital is \(item.capital) \(item.region)"
        
        return cell
    }

    // Handle row tap action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Work with the selected item
        if let selectedCell = tableView.cellForRow(at: indexPath) {
            
            // Show a check mark
            selectedCell.accessoryType = .checkmark
            
            // Fetch the data for the selected item
            let selectedData = searchList[indexPath.row]
            
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
