//
//  CitySceneV1.swift
//  Purpose - Control the "next" scene in the nav Disclosure workflow
//  This is a standard view controller
//  It is within a navigation workflow, with a presenter, and a maybe a successor
//

import UIKit

// Adopt the protocols that are appropriate for this controller
// For example... detail, add, edit, add+edit

class CitySceneV1: UIViewController {
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    // Passed-in object, if necessary
    var item: City!
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var cityName: UILabel!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityName.text = "\(item.name ?? "(none)") (pop. \(item.population))"
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
        
        // City workflow segue code...
        /*
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
        */
        
        // City task segue code...
        /*
        if segue.identifier == "toTaskScene" {
            
            // Your customized code goes here,
            // but here is some sample/starter code...
            
            // Get a reference to the next controller
            // Next controller is embedded in a new navigation controller
            // so we must go through it
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! CityDetailCD
            
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
        */
        
    }
    
}
