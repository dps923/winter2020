//
//  ChinookCustomerScene.swift
//  Purpose - Shows content for an item, in a standardview
//  Shows more data than the other Chinook customer scene
//

import UIKit

class ChinookCustomerWithEmployeeScene: UIViewController {

    // MARK: - Private instance variables
    
    private var item: Chinook_Customer?
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!

    // MARK: - User interface outlets
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var cityRegionCountryPostalCode: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var employeeInfo: UILabel!
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeTitle: UILabel!
    @IBOutlet weak var employeeAddress: UILabel!
    @IBOutlet weak var employeeCityRegionCountryPostalCode: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Chinook Customer & Employee"
        
        // Listen for a notification that new data is available for the list
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillAppear(_:)), name: Notification.Name("WebApiDataIsReady"), object: nil)
        
        // Get the data
        m.chinook_customers_GetOneWithEmployee()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        // Get the item
        item = m.chinookCustomer
        
        // Load up the user interface
        if let customer = item {
            
            name.text = "\(customer.FirstName) \(customer.LastName)"

            company.text = customer.Company == nil ? "(no company)" : customer.Company!
            
            address.text = customer.Address
            
            var city = customer.City
            if customer.State != nil {
                city.append(", \(customer.State!)")
            }
            city.append(", \(customer.Country)")
            if customer.PostalCode != nil {
                city.append(", \(customer.PostalCode!)")
            }
            cityRegionCountryPostalCode.text = city

            email.text = customer.Email
        }
        
        if let employee = item?.Employee {
            
            employeeInfo.text = "Customer's support rep:"
            
            employeeName.text = "\(employee.FirstName) \(employee.LastName)"
            employeeTitle.text = employee.Title
            
            employeeAddress.text = employee.Address
            
            var city = employee.City
            if employee.State != nil {
                city.append(", \(employee.State!)")
            }
            city.append(", \(employee.Country), \(employee.PostalCode)")
            employeeCityRegionCountryPostalCode.text = city
        }
        
    }

    /*
 
     // Build the name info
     cell.textLabel?.text = "\(data.LastName), \(data.FirstName)"
     // Build the address info
     var city = data.City
     if data.State != nil {
     city.append(", \(data.State!)")
     }
     cell.detailTextLabel?.text = "\(data.Address), \(city), \(data.Country)"

 */
    
}
