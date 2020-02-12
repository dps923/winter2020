//
//  StoreInitializer.swift
//  Purpose - Initializes the data store with starter data
//

import CoreData

class StoreInitializer {
    
    class func addStarterData(context: NSManagedObjectContext) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Example", in: context) else {
            fatalError("Can't create entity named Example")
        }
        
        // Add new objects to the context
        
        let obj = Example(entity: entity, insertInto: context)
        obj.name = randomString(randomInteger(between: 5, and: 15))
        obj.quantity = Int32(randomInteger(between: 10, and: 500))
        
        let obj2 = Example(entity: entity, insertInto: context)
        obj2.name = randomString(randomInteger(between: 5, and: 15))
        obj2.quantity = Int32(randomInteger(between: 10, and: 500))
        
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
