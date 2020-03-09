//
//  CompanyScene.swift
//  W10a1Entities
//
//  Created by Peter McIntyre on 2019-11-11.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class CompanyScene: UIViewController {
    
    // MARK: - Instance variables
    
    var m: DataModelManager!
    var item: Company!
    
    // MARK: - UI outlets
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyInfo: UILabel!
    @IBOutlet weak var companyCeo: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "\(item.name ?? "Generic") company"
        
        // Configure the fields
        companyName.text = "\(item.name ?? "Generic") company"
        companyInfo.text = "Started in \(item.yearStarted), in \(item.country ?? "Canada")"
        companyCeo.text = "CEO is \(item.ceo ?? "John Doe")"
        
        // Diagnostic
        /*
         for e in item.employees as! Set<Employee> {
         print(e.name!)
         }
         */
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEmployeeList" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! EmployeeList
            
            // Set other properties
            vc.items = item.employees?.sortedArray(using: [NSSortDescriptor(key: "name", ascending: true)]) as? [Employee]
            
            vc.title = "Employees"
            // Pass on the data model manager, if necessary
            vc.m = m
        }

        if segue.identifier == "toProductList" {
            
            // Get a reference to the next controller
            // Next controller is managed by the current nav controller
            let vc = segue.destination as! ProductList
            
            // Set other properties
            vc.items = item.products?.sortedArray(using: [NSSortDescriptor(key: "name", ascending: true)]) as? [Product]
            
            vc.title = "Products"
            // Pass on the data model manager, if necessary
            vc.m = m
        }
    }
    
}
