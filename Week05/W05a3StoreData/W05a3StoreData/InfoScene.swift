//
//  InfoScene.swift
//  W05a3StoreData
//
//  Created by Peter McIntyre on 2019-09-30.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class InfoScene: UIViewController {
    
    // Variables
    
    var m: DataModelManager!
    
    // Outlets
    
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var saveResult: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var allCustomers = "Customers:\n"
        for item in m.customers.data {
            allCustomers += "\(item.FirstName) \(item.LastName)\n"
        }
        var allEmployees = "Employees:\n"
        for item in m.employees.data {
            allEmployees += "\(item.FirstName) \(item.LastName)\n"
        }
        
        content.text = "\(allCustomers)\n\(allEmployees)"
    }
    
    // MARK: - Actions
    
    @IBAction func save(_ sender: UIButton) {
        
        // Attempt to save
        self.saveResult.text = m.saveData()
    }
    
}
