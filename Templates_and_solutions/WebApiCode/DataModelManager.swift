//
//  DataModelManager.swift
//  Purpose - Manages data model tasks for all modules in the app
//

import Foundation

class DataModelManager {
    
    // MARK: - Private internal instance variables
    
    // MARK: - Public properties (instance variables)
    
    var manufacturer: ExampleManufacturer?
    var manufacturers = [ExampleManufacturer]()
    
    var product: ExampleProduct?
    var products = [ExampleProduct]()
    
    // MARK: - Lifecycle
    
    init() {
        // Custom initialization goes here
    }
    
    // MARK: - Public methods (also look in extension blocks)
    
    
}

// Then...

// The code below must be pasted into the app delegate class
// There are two versions:
// 1. When the first scene is managed by a navigation controller
// 2. When the first scene is a standard view controller

// Copy the code below, and REPLACE the app delegate method
// application(didFinishLaunchingWithOptions:)

/*
 // For use when a navigation controller manages the first scene
 // In this situation, the storyboard entry point is a navigation controller
 // and the first controller is typically a table view controller
 
 // Create the data model manager
 let m = DataModelManager()
 
 // MARK: - Lifecycle
 
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
 // Get a reference to the navigation controller
 let nav = window!.rootViewController as! UINavigationController
 
 // Get a reference to the (table view) controller
 let vc = nav.viewControllers[0] as! XXX-FirstControllerName-XXX
 
 // Pass the model object to the (table view) controller
 vc.m = m
 
 return true
 }
 */

/*
 // For use when a standard view controller manages the first scene
 // In this situation, the storyboard entry point is NOT a navigation controller
 
 // Create the data model manager
 let m = DataModelManager()
 
 // MARK: - Lifecycle
 
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
 // Get a reference to the (standard view) controller
 let vc = window?.rootViewController as! XXX-FirstControllerName-XXX
 
 // Pass the model object to the (standard view) controller
 vc.m = m
 
 return true
 }
 */
