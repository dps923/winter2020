//
//  ChinookCustomerScene.swift
//  Purpose - Shows content for an item, in a standard view
//

import UIKit

class ChinookCustomerScene: UIViewController {

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

        title = "Chinook Customer"
        
        // Listen for a notification that new data is available for the list
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillAppear(_:)), name: Notification.Name("WebApiDataIsReady"), object: nil)
        
        // Get the data
        m.chinook_customers_GetOne()
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
    }
}
