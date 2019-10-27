//
//  Predicates.swift
//  Purpose - Typical predicates that can be copied and used elsewhere
//

import Foundation

// Do NOT create an instance of this class
// The code here is intended for use as a source for predicates
// Copy what you need out of this source code file

class ExamplePredicates {
    
    var m = DataModelManager()
    
    // Assume that we're working with the Example entity
    
    var item: Example!
    
    init() {
        item = m.example_CreateItem()
    }
    
    func predicates() {
        
        // Reminder, fetch request results will be a collection of zero or more items, or nil
        // Make sure that you consider this when working with the results
        
        // Object identifier
        _ = NSPredicate(format: "self == %@", item.objectID)
        
        // String match, case-insensitive
        _ = NSPredicate(format: "name ==[c] %@", item.name!)
        
        // More to come...
    }
    
}
