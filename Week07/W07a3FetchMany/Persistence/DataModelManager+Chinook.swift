//
//  DataModelManager+Chinook.swift
//  Purpose - Properties and methods for a specific entity in the app's data model
//

// This DataModelManager extension defines methods to be called in controllers
// Copy-then-paste an existing method, and then customize...
// > The "toUrlPath" string on line 26 (probably)
// > The type of the "result" on line 28
// > The save-to destination (i.e. the manager property) of the result on line 31
// It is also possible to customize the method parameter(s) on line 20
// In the base DataModelManager class,
// declare/define a property to hold the response (result) from the Web API

import Foundation

extension DataModelManager {

    // Get all Chinook customers
    func chinook_customers_GetAll() {
        
        // Create a request object (and configure it if necessary)
        let request = WebApiRequest()
        
        // Send the request, and write a completion method to pass to the request
        request.sendRequest(toUrlPath: "/getchinook-customers.json", completion: {
            
            (result: [Chinook_Customer]) in
            
            // Save the result in the manager property
            self.chinookCustomers = result
            
            // Post a notification
            NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
        })
    }

    // Get one specific Chinook customer
    func chinook_customers_GetOne() {
        
        // Create a request object (and configure it if necessary)
        let request = WebApiRequest()
        
        // Send the request, and write a completion method to pass to the request
        request.sendRequest(toUrlPath: "/getchinook-customers-23.json", completion: {
            
            (result: Chinook_Customer) in
            
            // Save the result in the manager property
            self.chinookCustomer = result
            
            // Post a notification
            NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
        })
    }

    // Get one specific Chinook customer WITH related employee data
    func chinook_customers_GetOneWithEmployee() {
        
        // Create a request object (and configure it if necessary)
        let request = WebApiRequest()
        
        // Send the request, and write a completion method to pass to the request
        request.sendRequest(toUrlPath: "/getchinook-customers-23-with-employee.json", completion: {
            
            (result: Chinook_Customer) in
            
            // Save the result in the manager property
            self.chinookCustomer = result
            
            // Post a notification
            NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
        })
    }

    // Cause an HTTP 404
    func chinook_customers_GetNone() {
        
        let request = WebApiRequest()
        
        request.sendRequest(toUrlPath: "/getchinook-doesnotexist.json", completion: {
            
            (result: String?) in
            
            print(result!)
        })
    }
}
