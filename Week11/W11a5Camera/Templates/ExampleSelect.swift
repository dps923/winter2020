//
//  ExampleSelect.swift
//  Purpose - Shows content for an item selection list
//  This is a table view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit

protocol ExampleSearchDelegate: class {
    
    func searchTaskDidCancel(_ controller: UIViewController)
    
    // Change the data type of the "item" to match your needs
    func searchTask(_ controller: UIViewController, didSelect item: Country)
}

class ExampleSearchList: UITableViewController {
    
    // MARK: - Variables
    
    weak var delegate: ExampleSearchDelegate?
    
    var searchList: [Country]!
    var searchResult: Country?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get or programmatically create the data for the list
        let ca = Country(name: "Canada", capital: "Ottawa", region: "ON")
        let us = Country(name: "United States", capital: "Washington", region: "DC")
        searchList = [ca, us]
    }
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Call into the delegate
        delegate?.searchTaskDidCancel(self)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        // Configure the cell...
        let item = searchList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Capital is \(item.capital) \(item.region)"
        
        return cell
    }
    
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
