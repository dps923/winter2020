//
//  DataModelManager+SICT.swift
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

    // Get all School of ICT employees
    func sict_employees_GetAll() {
        
        // Create a request object (and configure it if necessary)
        let request = WebApiRequest()
        
        // Send the request, and write a completion method to pass to the request
        request.sendRequest(toUrlPath: "/getsict-staff.json", completion: {
            
            (result: [SICT_EmployeeBase]) in
            
            // Save the result in the manager property
            self.sictEmployees = result
            
            // Post a notification
            NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
        })
    }
    
    // Get one specific SICT employee by identifier
    func sict_employees_GetOne(_ byId: Int) {
        
        // Create a request object (and configure it if necessary)
        let request = WebApiRequest()
        
        // Send the request, and write a completion method to pass to the request
        request.sendRequest(toUrlPath: "/getsict-staff-\(byId).json", completion: {
            
            (result: SICT_Employee) in
            
            // Save the result in the manager property
            self.sictEmployee = result
            
            // Post a notification
            NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
        })
    }

}
