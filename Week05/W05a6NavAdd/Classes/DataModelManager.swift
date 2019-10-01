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
    
    var productPackage = ProductPackage()
    
    // MARK: - Initializers
    
    init() {
        
        // Load the data for the app
        loadData()

        // First time loaded?
        if productPackage.data.count == 0 {
            
            // Load some starter items
            productPackage.data.append(Product(id: 23, name: "Paper pad", maker: "Hilroy", cost: 1.20))
            productPackage.data.append(Product(id: 24, name: "Ruler", maker: "Acme", cost: 0.20))
            productPackage.data.append(Product(id: 29, name: "Pencil", maker: "Dixon", cost: 0.10))
            productPackage.data.append(Product(id: 44, name: "Stapler", maker: "Stanley", cost: 5.60))
            productPackage.data.append(Product(id: 51, name: "Pen", maker: "BIC", cost: 0.20))
            
            // Update the other values
            productPackage.count = productPackage.data.count
        }
    }
    
    // MARK: - Private methods
    
    private func nextProductId() -> Int {
        
        // Look for the maximum "id" value, and return the next usable value
        return productPackage.data.reduce(0, { max($0, $1.id) }) + 1
    }
    
    private func productIndexById(_ id: Int) -> Int? {
        
        // Look for the index of the desired item
        return productPackage.data.firstIndex(where: {$0.id == id})
    }
    
    // Path to the app bundle
    private func appBundlePath() -> String? {
        
        return Bundle.main.path(forResource: "data-products", ofType: "json")
    }
    
    // Path to the documents folder
    private func appDocumentsPath() -> URL? {
        
        return FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("data-products.json")
    }
    
    // MARK: - Public methods
    
    func saveData() {
        
        // Create and configure a JSON encoder
        let encoder = JSONEncoder()
        
        // Choose the desired date decoding strategy
        encoder.dateEncodingStrategy = .iso8601
        
        if let encodedData = try? encoder.encode(self.productPackage) {
            do {
                try encodedData.write(to: appDocumentsPath()!)
            }
            catch {
                print("Failed to write app data: \(error.localizedDescription)")
            }
        }
    }
    
    func loadData() {
        
        // Attempt to read data
        //   First from the Documents folder
        //   If not found there, then from the app bundle folder
        //   If found there, immediately save the data to the Documents folder
        
        var appData = Data()
        
        if let path = appDocumentsPath() {
            
            // Path to documents does exist
            
            // Diagnostic
            print(path.absoluteString)
            
            do {
                appData = try Data(contentsOf: path)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        else if let path = appBundlePath() {
            
            // Path to bundle does exist
            
            do {
                appData = try Data(contentsOf: URL(fileURLWithPath: path))
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        // Attempt to decode, but only if appData has something in it
        if appData.count > 0 {
            
            // Create and configure a JSON decoder
            let decoder = JSONDecoder()
            // Choose the desired date decoding strategy
            decoder.dateDecodingStrategy = .iso8601
            
            // Attempt to decode the data into a "...Package" object
            do {
                let result = try decoder.decode(ProductPackage.self, from: appData)
                // Publish the result
                self.productPackage = result
            }
            catch {
                print("Decode error", error)
            }
        }
    }
    
    func productById(_ id: Int) -> Product? {
        
        // Search for matching identifier
        return productPackage.data.first(where: {$0.id == id})
    }
    
    func productByName(_ name: String) -> Product? {
        
        // Clean and prepare the name first
        let cleanName = name.trimmingCharacters(in: .whitespaces).lowercased()
        // Search for matching name
        return productPackage.data.first(where: {$0.name.lowercased() == cleanName})
    }
    
    func productAdd(_ newItem: Product) -> Product? {
        
        // Make a copy of the incoming data, so that we can mutate it
        // By default, function parameters are constants
        // We declare it with "let" here, which means that
        //   we can still mutate the local new item's values
        let localNewItem = newItem

        // Attempt to add the new item, by verifying non-null data
        // Data should ALSO be validated in the user interface controller that gets the data from the user
        // Doing it here too is done for code/data safety
        if !newItem.name.isEmpty && !newItem.maker.isEmpty && newItem.cost > 0.0 {
            // Set the value of "id"
            localNewItem.id = nextProductId()
            // Save it to the collection
            productPackage.data.append(localNewItem)
            productPackage.count = productPackage.data.count
            productPackage.timestamp = Date()
            
            return productPackage.data.last
        }
        return nil
    }
    
    func productEdit(_ editedItem: Product) -> Product? {
        
        // Attempt to locate the item
        if let index = productPackage.data.firstIndex(where: {$0.id == editedItem.id}) {
            
            // Attempt to update the existing item, by verifying non-null data
            // Data should ALSO be validated in the user interface controller that gets the data from the user
            // Doing it here too is done for code/data safety
            if !editedItem.name.isEmpty && !editedItem.maker.isEmpty && editedItem.cost > 0.0 {
                // Save it to the collection
                productPackage.data[index] = editedItem
                return productPackage.data[index]
            }
        }
        return nil
    }
    
    func productDelete(_ id: Int) -> Bool {
        
        // Attempt to locate the item
        if let item = productIndexById(id) {
            // Yes, has been located, so remove the item
            productPackage.data.remove(at: item)
            return true
        }
        return false
    }
    
    func productsSortedById() -> [Product] {
        
        // Sort the array; include a comparison function
        let sortedProducts = productPackage.data.sorted(by: { (p1: Product, p2: Product) -> Bool in return p1.id < p2.id })
        
        return sortedProducts
    }
    
    func productsSortedByName() -> [Product] {
        
        // Sort the array; include a comparison function
        let sortedProducts = productPackage.data.sorted(by: { (p1: Product, p2: Product) -> Bool in return p1.name.lowercased() < p2.name.lowercased() })
        
        return sortedProducts
    }
    
}

// Add the following statement...
// m.saveData()
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
