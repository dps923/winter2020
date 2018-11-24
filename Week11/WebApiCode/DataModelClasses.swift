//
//  DataModelClasses.swift
//  Purpose - Classes and structs that describe the shape of entities
//

import Foundation

// MARK: - Constructs for importing data

// Write a struct or class to describe the shape of each imported or externally-sourced entity

// Responses from (url)...

struct ExampleManufacturer: Decodable {
    let id: Int
    let name: String
    let address: String
    let products: [ExampleProduct]
}

struct ExampleProduct: Decodable {
    let id: Int
    let name: String
    let size: String
    let manufacturerId: Int
}
