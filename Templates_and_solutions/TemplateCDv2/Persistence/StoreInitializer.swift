//
//  StoreInitializer.swift
//  Purpose - Initializes the data store with starter data
//

import CoreData

class StoreInitializer {
    
    class func addStarterData(context: NSManagedObjectContext) {
        
        /*
        guard let entity = NSEntityDescription.entity(forEntityName: "Example", in: context) else {
            fatalError("Can't create entity named Example")
        }
        
        // Add new objects to the context
        
        let obj1 = Example(entity: entity, insertInto: context)
        obj1.name = randomString(randomInteger(between: 5, and: 15))
        obj1.quantity = Int32(randomInteger(between: 10, and: 500))
        
        let obj2 = Example(entity: entity, insertInto: context)
        obj2.name = randomString(randomInteger(between: 5, and: 15))
        obj2.quantity = Int32(randomInteger(between: 10, and: 500))
        */
        
        // Alternative, looping object creation...
        /*
        for _ in 1...5 {
            // Create and configure an object
            let obj3 = Example(context: context)
            obj3.name = randomString()
            obj3.quantity = Int32(randomInteger(between: 25, and: 525))
        }
        */
        
        // ############################################################
        
        // Alternatively, load from a JSON file in the app bundle...
        // Edit the code to match your own app's needs
        // Here we are using "Country" as an example entity
        /*
        // Get path to the file
        let appBundleCountries = Bundle.main.path(forResource: "data-countries", ofType: "json")
        
        // Local variables
        var countryData: Data!
        var countries = [Country]()
        
        // Attempt to read and decode
        do {
            countryData = try Data(contentsOf: URL(fileURLWithPath: appBundleCountries!))
        }
        catch {
            print(error.localizedDescription)
        }
        
        // Create and configure a JSON decoder
        let decoder = JSONDecoder()
        // Set the date decoding strategy, full or fractional seconds
        //decoder.dateDecodingStrategy = .iso8601
        //decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        // Assume that the source JSON is an array of country objects
        // Attempt to decode the data into a "Country" array
        do {
            let result = try decoder.decode([Country].self, from: countryData)
            // Publish the result
            countries = result
            // Diagnostic
            dump(countries)
        }
        catch {
            print(error)
        }
        */
        
        // ############################################################
        
        // Alternatively, load from a web API
        // (more to come)
        
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
