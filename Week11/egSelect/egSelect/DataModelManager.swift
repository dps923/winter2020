//
//  DataModelManager.swift
//  egSelect
//

import Foundation

class DataModelManager {
    
    // MARK: - Private instance variables
    
    private var colourList = [String]()

    // MARK: - Methods for the Example entity
    
    // Fetch all (data exists in memory only in this code example)
    func example_GetAll() -> [String] {
        
        if colourList.count > 0 {
            return colourList
        }
        else {
            // Must build colour list
            colourList.append("Red")
            colourList.append("Green")
            colourList.append("Blue")
            colourList.append("Yellow")
            colourList.append("Brown")
            colourList.append("Black")
            colourList.append("Orange")
            colourList.append("White")

            return colourList
        }
    }

}
