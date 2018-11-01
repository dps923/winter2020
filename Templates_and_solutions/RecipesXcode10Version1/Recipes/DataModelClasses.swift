//
//  DataModelClasses.swift
//  Purpose - Describes the entity classes used in the app
//

import Foundation

class Product: NSObject, Codable {
    
    // When creating a new item, do NOT provide a value for "id"
    // It will get calculated by the data model manager 
    
    // MARK: - Data properties
    
    var id: Int = 0
    var name: String = ""
    var maker: String = ""
    var cost: Double = 0.0
    
    // MARK: - Initializers

    // Default initializer
    init(name: String, maker: String, cost: Double) {
        // The id property will be set elsewhere (e.g. in the data model manager)
        self.name = name
        self.maker = maker
        self.cost = cost
    }
    
}
