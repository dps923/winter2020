//
//  DataModelManager.swift
//  W07a1NewFetch
//
//  Created by Peter McIntyre on 2019-10-15.
//  Copyright © 2019 SICT. All rights reserved.
//

import Foundation

class DataModelManager {
    
    // MARK: - Variables
    
    var coursePackage: CoursePackage?
    var courses = [Course]()
    
    // MARK: - Lifecycle
    
    // MARK: - Actions
    
    func courseGetAll() {
        
        // Create a request object (and configure it if necessary)
        let request = WebApiRequest()
        
        // Send the request, and write a completion method to pass to the request
        request.sendRequest(toUrlPath: "/path-to/data.json") { (result: CoursePackage) in
            
            // Save the result in the manager property
            self.coursePackage = result
            self.courses = self.coursePackage!.data
            
            // Post a notification
            NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
        }
    }

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
