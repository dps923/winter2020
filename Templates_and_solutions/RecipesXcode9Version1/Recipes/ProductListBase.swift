//
//  ProductListBase.swift
//  Purpose - Shows content for a collection, in a table view
//  This is a table view controller
//  Can be used anywhere in the navigation workflow (start, mid, end)
//

import UIKit

// Adopt the protocols that are appropriate for this controller

class ProductListBase: UITableViewController {
    
    // MARK: - Instance variables
    
    // Use if a collection is passed in, or fetched from data model manager
    var items = [Product]()
    
    // Use if an object MAY be passed in
    //var item: Product?
    // Use if an object WILL be passed in
    //var item: Product!
    
    // Use if a reference to the data model manager is passed in
    // If you don't like the variable name, change it
    var m: DataModelManager!
    
    // MARK: - Outlets (user interface)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the locally-defined instance variable for the collection
        items = m.products
        // Alternatives...
        items = m.productsSortedById()
        items = m.productsSortedByName()
        
        // Set a title here or on the storyboard scene
        title = "Products"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // We must refresh the data in the table view
        // First, refresh the data source
        items = m.productsSortedByName()
        // Then, ask the table view to reload itself
        tableView.reloadData()
    }
    
    // MARK: - Table view building
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // For many apps done in the DPS923/MAP523 course, there is one (1) section
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // Get this value from the "count" of the collection that's used in the table view
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // #warning Match the value "cell" with the value used on the prototype cell attributes inspector in the storyboard editor
        
        // Configure the cell...
        
        // Get the object we want
        let item = items[indexPath.row]
        
        // Configure the UI objects
        cell.textLabel?.text = item.name
        //cell.detailTextLabel?.text = item.maker
        // etc.
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            // Remember that the table view "data source" is NOT the same
            // as the table view "rows"
            
            // First, get the row data, so we can get its identifier
            let item = m.products[indexPath.row]
            
            // Next, attempt to delete the item from the data source
            if m.productDelete(item.id) {
                // Yes, successful, so continue...
                // Refresh the data source
                items = m.productsSortedByName()
                // Remove the row
                tableView.deleteRows(at: [indexPath], with: .fade)
                // Reload the table view
                tableView.reloadData()
            }
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Add "if" blocks to cover all the possible segues
        // One for each workflow (navigation) or task segue
        
        // A workflow segue is managed by the current nav controller
        // A task segue goes to a scene that's managed by a NEW nav controller
        // So there's a difference in how we get a reference to the next controller
        
        // Example workflow segue code...
        /*
        if segue.identifier == "toWorkflowScene" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ProductScene
            // Alternative... next controller is a table view controller
            //let vc = segue.destination as! ProductList
            
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = items[indexPath!.row]
            
            // Set other properties
            vc.item = selectedData
            vc.title = selectedData.name
            // Pass on the data model manager, if necessary
            //vc.m = m
            // Set the delegate, if configured
            //vc.delegate = self
        }
        */
        
        // Example task segue code...
        /*
        if segue.identifier == "toTaskScene" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is embedded in a new navigation controller
            // so we must go through it
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! ProductDetail
            
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = items[indexPath!.row]
            
            // Set other properties
            vc.item = selectedData
            vc.title = selectedData.name
            // Pass on the data model manager, if necessary
            //vc.m = m
            // Set the delegate, if configured
            //vc.delegate = self
        }
        */
        
    }
    
}
