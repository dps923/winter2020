//
//  DataModelClasses.swift
//  Purpose - Classes and structs that describe the shape of entities
//

import Foundation

// MARK: - Constructs for importing data

// Write a struct or class to describe the shape of each imported or externally-sourced entity

// Incoming JSON data, here are the structs
// The incoming data is an array

struct DataCompany: Decodable {
    let name: String
    let country: String
    let yearStarted: Int
    let ceo: String
    let employees: [DataEmployee]
    let products: [DataProduct]
}

struct DataEmployee: Decodable {
    let name: String
    let title: String
    let birthDate: Date
    let photo: String
}

struct DataProduct: Decodable {
    let name: String
    let cost: Double
    let size: String
    let photo: String
}

// Example shape for a "Country" entity
struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
}

// MARK: - Constructs for data within the app

struct ExampleAdd {
    let name: String
    let quantity: Int
}

// Write a struct or class (below) to describe the shape of each entity

// This is an "extension"
// Its job is to add to the base DateFormatter class
// It will enable us to handle JSON date strings that have fractional seconds
extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
