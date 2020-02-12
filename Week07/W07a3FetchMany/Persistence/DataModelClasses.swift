//
//  DataModelClasses.swift
//  Purpose - Classes and structs that describe the shape of entities
//

import Foundation

// MARK: - Constructs for importing data

// Write a struct or class to describe the shape of each imported or externally-sourced entity

// Responses from https://dps923.ca/media/getchinook...

struct Chinook_Customer: Decodable {
    let CustomerId: Int
    let FirstName: String
    let LastName: String
    let Company: String?
    let Address: String
    let City: String
    let State: String?
    let Country: String
    let PostalCode: String?
    let Phone: String?
    let Fax: String?
    let Email: String
    let SupportRepId: Int
    let Employee: Chinook_Employee?
}

struct Chinook_Employee: Decodable {
    let EmployeeId: Int
    let FirstName: String
    let LastName: String
    let Title: String
    let ReportsTo: Int?
    let BirthDate: String
    let HireDate: String
    let Address: String
    let City: String
    let State: String?
    let Country: String
    let PostalCode: String
    let Phone: String
    let Fax: String?
    let Email: String
    let Customers: [Chinook_Customer]?
}

// Responses from https://dps923.ca/media/getsict...

struct SICT_EmployeeBase: Decodable {
    let Id: Int
    let FirstName: String
    let LastName: String
}

struct SICT_Employee: Decodable {
    let Id: Int
    let FirstName: String
    let LastName: String
    let ReportsToEmployeeId: Int?
    let ReportsToEmployee: SICT_EmployeeBase?
    let EmployeesSupervised: [SICT_EmployeeBase]
    let HomeAddress: SICT_Address?
    let WorkAddress: SICT_Address?
    let JobDuties: [SICT_JobDuty]
}

struct SICT_Address: Decodable {
    let Id: Int
    let EmployeeId: Int
    let AddressLine1: String
    let AddressLine2: String?
    let CityAndProvince: String
    let PostalCode: String
}

struct SICT_JobDuty: Decodable {
    let Id: Int
    let Name: String
    let Description: String
}
