//
//  DataModelManager.swift
//  Purpose - Is the data model manager module/controller for the app
//

//  There is commented-out code at the bottom of this file
//  It enables the initialization and configuration of the data model manager
//  in the app delegate class

import Foundation

class DataModelManager {
    
    // MARK: - Data properties
    
    var products = [Product]()
    
    // MARK: - Initializers
    
    init() {
        
        // Load the saved plist
        loadPlist()
        
        // First time loaded?
        if products.count == 0 {
            
            // Load some starter items
            products.append(Product(name: "Paper pad", maker: "Hilroy", cost: 1.20))
            products.append(Product(name: "Ruler", maker: "Acme", cost: 0.20))
            products.append(Product(name: "Pencil", maker: "Dixon", cost: 0.10))
            products.append(Product(name: "Stapler", maker: "Stanley", cost: 5.60))
            products.append(Product(name: "Pen", maker: "BIC", cost: 0.20))
            
            // Set their identifiers
            for i in 0..<products.count {
                products[i].id = i + 1
            }
        }
    }
    
    // MARK: - Private methods
    
    private func nextProductId() -> Int {
        
        // Look for the maximum "id" value, and return the next usable value
        return products.reduce(0, { max($0, $1.id) }) + 1
    }
    
    private func productIndexById(_ id: Int) -> Int? {
        
        // Look for the index of the desired item
        return products.firstIndex(where: {$0.id == id})
    }
    
    private func appDataFilePath() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // Optional (for learning, inspection, and troubleshooting)
        //print(paths[0])
        return paths[0].appendingPathComponent("appdata.plist")
    }
    
    // MARK: - Public methods
    
    func savePlist() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(products)
            try data.write(to: appDataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array")
        }
    }
    
    func loadPlist() {
        if let data = try? Data(contentsOf: appDataFilePath()) {
            let decoder = PropertyListDecoder()
            do {
                products = try decoder.decode([Product].self, from: data)
            } catch {
                print("Error decoding item array")
            }
        }
    }
    
    func productById(_ id: Int) -> Product? {
        
        // Search for matching identifier
        return products.first(where: {$0.id == id})
    }
    
    func productByName(_ name: String) -> Product? {
        
        // Clean and prepare the name first
        let cleanName = name.trimmingCharacters(in: .whitespaces).lowercased()
        // Search for matching name
        return products.first(where: {$0.name.lowercased() == cleanName})
    }
    
    func productAdd(_ newItem: Product) -> Product? {
        
        // Attempt to add the new item, by verifying non-null data
        // Data should ALSO be validated in the user interface controller that gets the data from the user
        // Doing it here too is done for code/data safety
        if !newItem.name.isEmpty && !newItem.maker.isEmpty && newItem.cost > 0.0 {
            // Set the value of "id"
            newItem.id = nextProductId()
            // Save it to the collection
            products.append(newItem)
            return products.last
        }
        return nil
    }
    
    func productEdit(_ editedItem: Product) -> Product? {
        
        // Attempt to locate the item
        if let index = products.firstIndex(where: {$0.id == editedItem.id}) {
            
            // Attempt to update the existing item, by verifying non-null data
            // Data should ALSO be validated in the user interface controller that gets the data from the user
            // Doing it here too is done for code/data safety
            if !editedItem.name.isEmpty && !editedItem.maker.isEmpty && editedItem.cost > 0.0 {
                // Save it to the collection
                products[index] = editedItem
                return products[index]
            }
        }
        return nil
    }
    
    func productDelete(_ id: Int) -> Bool {
        
        // Attempt to locate the item
        if let item = productIndexById(id) {
            // Yes, has been located, so remove the item
            products.remove(at: item)
            return true
        }
        return false
    }
    
    func productsSortedById() -> [Product] {
        
        // Sort the array; include a comparison function
        let sortedProducts = products.sorted(by: { (p1: Product, p2: Product) -> Bool in return p1.id < p2.id })
        
        return sortedProducts
    }
    
    func productsSortedByName() -> [Product] {
        
        // Sort the array; include a comparison function
        let sortedProducts = products.sorted(by: { (p1: Product, p2: Product) -> Bool in return p1.name.lowercased() < p2.name.lowercased() })
        
        return sortedProducts
    }
    
}

// Add the following statement...
// m.savePlist()
// ...to these methods in the app delegate class:
// func applicationDidEnterBackground(_ application: UIApplication)
// func applicationWillTerminate(_ application: UIApplication)

// Then...

// The code below must be pasted into the app delegate class
// There are two versions:
// 1. When a table view controller manages the first scene
// 2. When a standard view controller manages the first scene

// Copy the code below, and REPLACE the app delegate method
// application(didFinishLaunchingWithOptions:)

/*
// For use when a table view controller manages the first scene
// In this situation, the storyboard entry point is a navigation controller
 
// Create the data model manager
let m = DataModelManager()

// MARK: - Lifecycle

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Get a reference to the navigation controller
    let nav = window!.rootViewController as! UINavigationController
    
    // Get a reference to the (table view) controller
    let tvc = nav.viewControllers[0] as! ProductList
    
    // Pass the model object to the (table view) controller
    tvc.m = m
    
    return true
}
*/

/*
 // For use when a standard view controller manages the first scene
 // In this situation, the storyboard entry point is NOT a navigation controller

 // Create the data model manager
 let m = DataModelManager()
 
 // MARK: - Lifecycle
 
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 
 // Get a reference to the (standard view) controller
 let tvc = nav.rootViewController as! ProductStartView
 
 // Pass the model object to the (standard view) controller
 tvc.m = m
 
 return true
 }
 */
