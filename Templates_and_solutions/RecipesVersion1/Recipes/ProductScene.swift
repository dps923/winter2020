//
//  ProductScene.swift
//  Purpose - Control the "next" scene in the nav Disclosure workflow
//  This is a standard view controller
//  It is within a navigation workflow, with a presenter, and a successor
//

import UIKit

class ProductScene: UIViewController, EditProductDelegate {
    
    // MARK: - Instance variables
    
    // Use if a collection is passed in, or fetched from data model manager
    //var items = [Product]()
    
    // Use if an object MAY be passed in
    //var item: Product?
    // Use if an object WILL be passed in
    var item: Product!
    
    // Use if a reference to the data model manager is passed in
    // If you don't like the variable name, change it
    var m: DataModelManager!
    
    // MARK: - Outlets (user interface)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update the user interface
        //item = m.productById(item.id)
        //title = item.name
    }
    
    func editTaskDidCancel(_ controller: UIViewController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func editTask(_ controller: UIViewController, didSave item: Product) {
        // In general, the item type is suggested as Any, which you can cast, or...
        // Recommendation - change the type to match the actual item type
        
        // Attempt to save the updated product
        if m.productEdit(item) != nil {
            
            // Update the user interface
            self.item = item
            self.title = item.name
            //productName.text = item.name
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Actions (user interface)
    
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
        if segue.identifier == "toWorkflowScene" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ProductScene
            
            // Fetch and prepare the data to be passed on
            let selectedData = item
            
            // Set other properties
            vc.item = selectedData
            vc.title = selectedData?.name
            // Pass on the data model manager, if necessary
            //vc.m = m
            // Set the delegate, if configured
            //vc.delegate = self
        }
        
        // Example task segue code...
        if segue.identifier == "toTaskScene" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is embedded in a new navigation controller
            // so we must go through it
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! ProductDetail
            
            // Fetch and prepare the data to be passed on
            let selectedData = item
            
            // Set other properties
            vc.item = selectedData
            vc.title = selectedData?.name
            // Pass on the data model manager, if necessary
            //vc.m = m
            // Set the delegate, if configured
            //vc.delegate = self
        }
        
        // Other segues...
        if segue.identifier == "toProductScene2" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ProductSceneNext
            
            // Fetch and prepare the data to be passed on
            let selectedData = item
            
            // Set other properties
            vc.item = selectedData
            //vc.title = selectedData?.name
            vc.title = "End of nav flow"
            // Pass on the data model manager, if necessary
            //vc.m = m
            // Set the delegate, if configured
            //vc.delegate = self
        }

    }
    
}
