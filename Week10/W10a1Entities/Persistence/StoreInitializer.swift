//
//  StoreInitializer.swift
//  Purpose - Initializes the data store with starter data
//

import CoreData

class StoreInitializer {
    
    class func addStarterData(context: NSManagedObjectContext) {
        
        // Load from a JSON file in the app bundle...
        // Edit the code to match your own app's needs
        // Here we are using "Country" as an example entity
        
        // Get path to the file
        let appBundleData = Bundle.main.path(forResource: "data-multi-entities", ofType: "json")
        
        // Local variables
        var companyData: Data!
        //var companies = [DataCompany]()
        
        // Attempt to read and decode
        do {
            companyData = try Data(contentsOf: URL(fileURLWithPath: appBundleData!))
        }
        catch {
            print(error.localizedDescription)
        }
        
        // Create and configure a JSON decoder
        let decoder = JSONDecoder()
        // Set the date decoding strategy, full or fractional seconds
        decoder.dateDecodingStrategy = .iso8601
        //decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        // The source JSON is an array of company objects
        // Attempt to decode the data into a "DataCompany" array
        do {
            let companies = try decoder.decode([DataCompany].self, from: companyData)
            
            // Diagnostic
            //dump(companies[2])
            
            // Save the result to the Core Data store
            // Here's the strategy:
            // 1. For each incoming company, create a Company object
            // 2. Configure its basic properties
            // 3. Then for that incoming company,
            //    go through its "employees" collection
            // 4. Add a new Employee object for each,
            //    and set its relationship value
            // 5. Then, for that incoming company,
            //    do the same thing, and
            //    go through its "products" collection
            // 6. Add a new Product object for each,
            //    and set its relationship value
            
            for c in companies {
                
                // Make and configure a new Company object
                // using values from the incoming data
                let co = Company(context: context)
                co.name = c.name
                co.country = c.country
                co.ceo = c.ceo
                co.yearStarted = Int32(c.yearStarted)
                
                // Go through the incoming data object's "employees" collection
                for e in c.employees {
                    
                    // Make and configure a new Employee object
                    let em = Employee(context: context)
                    em.name = e.name
                    em.title = e.title
                    em.birthDate = e.birthDate
                    em.photo = e.photo
                    
                    // Set the relationship
                    em.company = co
                }
                
                // Go through the incoming data object's "products" collection
                for p in c.products {
                    
                    // Make and configure a new Product object
                    let pr = Product(context: context)
                    pr.name = p.name
                    pr.size = p.size
                    pr.cost = p.cost
                    pr.photo = p.photo
                    
                    // Set the relationship
                    pr.company = co
                }
            }
        }
        catch {
            print(error)
        }
        
    }
    
    // Generate a random integer between two values
    class func randomInteger(between min: Int, and max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }
    
    // Generate a random string, default length is 12
    class func randomString(_ length: Int? = 12) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length!).map{ _ in letters.randomElement()! })
    }
    
}
