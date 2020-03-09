//
//  DataModelClasses.swift
//  Purpose - Classes and structs that describe the shape of entities
//

import Foundation

// MARK: - Constructs for importing data

// Write a struct or class to describe the shape of each imported or externally-sourced entity

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

// This is what a person object looks like
struct PersonIncoming: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let city: String
    let province: String
    let ip_address: String
}

// The "data-persons.json" file is an array of person objects
struct PersonPackage: Codable {
    var data = [PersonIncoming]()
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
