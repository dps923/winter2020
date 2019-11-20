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

// Easy date formatting code...
// Assume you want a date string like "November 20, 2019"
// and that "birthDateLabel" is a UI label, and "item" is the data object

//let df = DateFormatter()
//df.dateFormat = "MMMM d, yyyy"
//birthDateLabel.text = "Birth date \(df.string(from: item.birthDate))"
