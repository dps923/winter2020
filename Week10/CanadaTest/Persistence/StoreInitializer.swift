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
        obj.name = randomString(length: randomInteger(between: 5, and: 15))
        obj.quantity = Int32(randomInteger(between: 10, and: 500))
        
        let obj2 = Example(entity: entity, insertInto: context)
        obj2.name = randomString(length: randomInteger(between: 5, and: 15))
        obj2.quantity = Int32(randomInteger(between: 10, and: 500))

    }
    
    // Generate a random integer between two values
    class func randomInteger(between min: Int, and max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }
    
    // This is UGLY code
    // For Swift 4.0 and 4.1
    // The code is improved in Swift 4.2 (see the next / below commented out method)
    class func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    /*
     // For Swift 4.2 and beyond
     func randomString(length: Int) -> String {
     let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
     return String((0...length-1).map{ _ in letters.randomElement()! })
     }
     */
    
}
