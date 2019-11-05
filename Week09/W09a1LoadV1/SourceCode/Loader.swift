//
//  Loader.swift
//  W09a1LoadV1
//  This is a standard view controller
//  It is within a navigation workflow, with a presenter, and a maybe a successor
//

import UIKit
import CoreData

// Adopt the protocols that are appropriate for this controller (detail, add, etc.)

class Loader: UIViewController {
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    // MARK: - Outlets (user interface)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions (user interface)
    
    @IBAction func loadProgrammatically(_ sender: UIButton) {
        
        // Programmatically create and save Example objects
        // ================================================
        for _ in 1...5 {
            // Create and configure an object
            let foo = Example(context: m.ds_context)
            foo.name = StoreInitializer.randomString()
            foo.quantity = Int32(StoreInitializer.randomInteger(between: 25, and: 525))
        }
        // Save
        m.ds_save()
        
        // Fetch all Example objects from the store
        // ========================================
        let fetchRequest: NSFetchRequest<Example> = Example.fetchRequest()
        do {
            let results = try m.ds_context.fetch(fetchRequest)
            // Display the objects in the debug console
            for item in results {
                print("Name \(item.name!), quantity \(item.quantity)")
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Report the number of Example objects in the Core Data store
        // ===========================================================
        let count = try? m.ds_context.count(for: fetchRequest)
        print("Example object count: \(count ?? 0)")
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toExampleList" {
            
            // Get a reference to the next controller
            let vc = segue.destination as! ExampleList
            
            // Pass on the data model manager, if necessary
            vc.m = m
        }
        
    }
    
}
