//
//  SICTEmployeeScene.swift
//  Purpose - Shows content for an item, in a standard view
//

import UIKit

class SICTEmployeeScene: UIViewController {

    // MARK: - Private instance variables
    
    private var item: SICT_Employee?
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    var employeeId: Int!
    
    // MARK: - User interface outlets

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var reportsToPrompt: UILabel!
    @IBOutlet weak var reportsToName: UILabel!
    @IBOutlet weak var employeesSupervisedPrompt: UILabel!
    @IBOutlet weak var employeesSupervisedList: UITextView!
    
    @IBOutlet weak var homeAddressPrompt: UILabel!
    @IBOutlet weak var homeAddress: UITextView!
    @IBOutlet weak var workAddressPrompt: UILabel!
    @IBOutlet weak var workAddress: UITextView!
    
    @IBOutlet weak var jobDutiesPrompt: UILabel!
    @IBOutlet weak var jobDutiesList: UITextView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if employeeId == 4 { title = "Employee & reporting" }
        if employeeId == 1 { title = "Employee data (full)" }

        // Listen for a notification that new data is available for the list
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillAppear(_:)), name: Notification.Name("WebApiDataIsReady"), object: nil)
        
        // Get the data
        m.sict_employees_GetOne(employeeId)
    }

    override func viewWillAppear(_ animated: Bool) {
        
        // Get the item
        item = m.sictEmployee
        
        // Load up the user interface
        if let employee = item {
            
            name.text = "\(employee.FirstName) \(employee.LastName)"
            
            if let reportsTo = employee.ReportsToEmployee {
            
                reportsToPrompt.text = "Reports to:"
                reportsToName.text = "\(reportsTo.FirstName) \(reportsTo.LastName)"
            }
            else { reportsToPrompt.text = "" }
            
            if employee.EmployeesSupervised.count > 0 {
            
                let employeesSupervised = employee.EmployeesSupervised
                employeesSupervisedPrompt.text = "Employees supervised:"
                employeesSupervisedList.text = ""
                for e in employeesSupervised {
                    employeesSupervisedList.text.append("\(e.FirstName) \(e.LastName)\n")
                }
            }
            else {
                employeesSupervisedPrompt.text = ""
                employeesSupervisedList.text = ""
            }

            if employee.JobDuties.count > 0 {
                
                let jobDuties = employee.JobDuties
                jobDutiesPrompt.text = "Job duties:"
                jobDutiesList.text = ""
                for j in jobDuties {
                    jobDutiesList.text.append("\(j.Name): \(j.Description)\n")
                }
            }
            else {
                jobDutiesPrompt.text = ""
                jobDutiesList.text = ""
            }

            if let hadd = employee.HomeAddress {
                
                homeAddressPrompt.text = "Home address:"
                var add = hadd.AddressLine1
                if hadd.AddressLine2 != nil {
                    add.append("\n\(hadd.AddressLine2!)")
                }
                add.append("\n\(hadd.CityAndProvince), \(hadd.PostalCode)")
                homeAddress.text = add
            }
            else {
                homeAddressPrompt.text = ""
                homeAddress.text = ""
            }
            
            if let wadd = employee.WorkAddress {
                
                workAddressPrompt.text = "Work address:"
                var add = wadd.AddressLine1
                if wadd.AddressLine2 != nil {
                    add.append("\n\(wadd.AddressLine2!)")
                }
                add.append("\n\(wadd.CityAndProvince), \(wadd.PostalCode)")
                workAddress.text = add
            }
            else {
                workAddressPrompt.text = ""
                workAddress.text = ""
            }

        }
    }
}
