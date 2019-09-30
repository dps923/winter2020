//
//  DataModelManager.swift
//  W05a3StoreData
//
//  Created by Peter McIntyre on 2019-09-30.
//  Copyright © 2019 SICT. All rights reserved.
//

import Foundation

class DataModelManager {
    
    // MARK: - Private variables
    
    var urlDocumentsCustomers: URL?
    var urlDocumentsEmployees: URL?

    var pathBundleCustomers: String?
    var pathBundleEmployees: String?
    
    // MARK: - Public data properties

    var customers: CustomerPackage!
    var employees: EmployeePackage!
    
    // MARK: - Initializers
    
    init() {
        
        // Declare file system paths
        
        urlDocumentsCustomers = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("data-customers.json")
        
        urlDocumentsEmployees = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("data-employees.json")
        
        pathBundleCustomers = Bundle.main.path(forResource: "data-customers", ofType: "json")
        pathBundleEmployees = Bundle.main.path(forResource: "data-employees", ofType: "json")

        // Diagnostic
        //print("Documents: \(urlDocumentsCustomers!.absoluteString)")
        //print("Bundle: \(pathBundleCustomers!)")

        // Load the data
        loadData()
    }
    
    // MARK: - Private internal methods
    
    private func loadData() {
        
        // This method is organized as follows:
        // Attempt to read customers
        //   First from the Documents folder
        //   If not found, then from the app bundle folder
        // Attempt to read employees
        //   First from the Documents folder
        //   If not found, then from the app bundle folder

        // Attempt to read customers
        //   First from the Documents folder
        //   If not found, then from the app bundle folder

        var customerData: Data!
        
        if FileManager.default.fileExists(atPath: urlDocumentsCustomers!.absoluteString) {
            do {
                customerData = try Data(contentsOf: urlDocumentsCustomers!)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        else {
            do {
                customerData = try Data(contentsOf: URL(fileURLWithPath: pathBundleCustomers!))
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        // Create and configure a JSON decoder
        let decoder = JSONDecoder()
        // We must use the following, because the JSON data has fractional seconds,
        // and the built-in Swift ISO 8601 decoding strategy does not work with them
        // Look in the DataModelClasses.swift source code file for the new formatter
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        // Attempt to decode the data into a "CustomerPackage" object
        do {
            let result = try decoder.decode(CustomerPackage.self, from: customerData)
            // Publish the result
            self.customers = result
        }
        catch {
            print(error)
        }

        // Attempt to read employees
        //   First from the Documents folder
        //   If not found, then from the app bundle folder

        var employeeData: Data!

        if FileManager.default.fileExists(atPath: urlDocumentsEmployees!.absoluteString) {
            do {
                employeeData = try Data(contentsOf: urlDocumentsEmployees!)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        else {
            do {
                employeeData = try Data(contentsOf: URL(fileURLWithPath: pathBundleEmployees!))
            }
            catch {
                print(error.localizedDescription)
            }
        }

        // Reuse the JSON decoder that was created above
        // However, configure it for standard ISO 8601 dates that don't have fractional seconds
        decoder.dateDecodingStrategy = .iso8601

        // Attempt to decode the data into a "EmployeePackage" object
        do {
            let result = try decoder.decode(EmployeePackage.self, from: employeeData)
            // Publish the result
            self.employees = result
        }
        catch {
            print(error)
        }

    }
    
    // MARK: - Public methods

    func saveData() -> String {
        
        var saveResult = ""

        // Create and configure a JSON encoder
        let encoder = JSONEncoder()

        // Customer date encoder strategy
        encoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        if let encodedData = try? encoder.encode(self.customers) {
        //if let encodedData = try? JSONEncoder().encode(self.customers) {
            do {
                try encodedData.write(to: urlDocumentsCustomers!)
                saveResult = "Data was saved"
            }
            catch {
                print("Failed to write customer data: \(error.localizedDescription)")
                saveResult = "Error saving data"
            }
        }

        // Employee date encoder strategy
        encoder.dateEncodingStrategy = .iso8601
        
        if let encodedData = try? encoder.encode(self.employees) {
            //if let encodedData = try? JSONEncoder().encode(self.customers) {
            do {
                try encodedData.write(to: urlDocumentsEmployees!)
                saveResult = "Data was saved"
            }
            catch {
                print("Failed to write employee data: \(error.localizedDescription)")
                saveResult = "Error saving data"
            }
        }
        
        return saveResult
    }
}
