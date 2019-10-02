//
//  DataModelClasses.swift
//  Purpose - Describes the entity classes used in the app
//

import Foundation

class Product: /*NSObject,*/ Codable {
    
    // When creating a new item, do NOT provide a value for "id"
    // It will get calculated by the data model manager 
    
    // MARK: - Data properties
    
    var id: Int = 0
    var name: String = ""
    var maker: String = ""
    var cost: Double = 0.0
    
    // MARK: - Initializers

    // Default initializer
    init(id: Int, name: String, maker: String, cost: Double) {
        self.id = id
        self.name = name
        self.maker = maker
        self.cost = cost
    }
}

class ProductPackage: Codable {
    
    // MARK: - Data properties

    var timestamp: Date = Date()
    var version: String = "1.0.0"
    var count: Int = 0
    var data = [Product]()
}
