//
//  DataModelClasses.swift
//  W05a3StoreData
//
//  Created by Peter McIntyre on 2019-09-30.
//  Copyright © 2019 SICT. All rights reserved.
//

import Foundation

// For "Date" types, the coder and decoder need ISO 8601 configuration

struct Employee: Codable {
    let EmployeeId: Int
    let LastName: String
    let FirstName: String
    let Title: String
    let ReportsTo: Int?
    let BirthDate: Date
    let HireDate: Date
    let Address: String
    let City: String
    let State: String
    let Country: String
    let PostalCode: String
    let Phone: String
    let Fax: String
    let Email: String
}

struct EmployeePackage: Codable {
    let timestamp: Date
    let version: String
    let count: Int
    let data: [Employee]
}

struct Customer: Codable {
    let CustomerId: Int
    let FirstName: String
    let LastName: String
    let Company: String?
    let Address: String
    let City: String
    let State: String?
    let Country: String
    let PostalCode: String
    let Phone: String
    let Fax: String?
    let Email: String
    let SupportRepId: Int
    let DateCreated: Date
}

struct CustomerPackage: Codable {
    let timestamp: Date
    let version: String
    let count: Int
    let data: [Customer]
}

// This is an "extension" - you will learn about these soon
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
