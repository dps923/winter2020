//
//  ViewController.swift
//  W02a3Picker
//
//  Created by Peter McIntyre on 2019-09-11.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // Variables
    
    // Static data in this controller
    // In the future (but soon), we will use a "model object"
    // to provide and manage the app's data
    let cities = [
        "Ottawa", "Kingston", "Belleville", "Peterborough",
        "GTA East", "Toronto", "York Region", "Brampton",
        "Mississauga", "GTA West", "Hamilton", "Niagara Region",
        "Waterloo Region", "London", "Windsor"
    ]
    
    // Outlets
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var cityPicker: UIPickerView!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the delegate and data source in code statements
        cityPicker.dataSource = self
        cityPicker.delegate = self
        
        // Alternatively, can set them in the
        // Interface Builder visual editor
        
        // Set the initial city selected
        // First, get the selected row in the picker
        // Then use that value to fetch the data out of the data source
        result.text = "I live in \(cities[cityPicker.selectedRow(inComponent: 0)])"
    }

    // Picker view data source (configuring its dimensions)
    
    // Assume one spinner (component)
    // We need two methods
    
    // This gets called ONCE
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // This gets called once for each component (spinner)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    // Picker view delegate (row content, row selection)
    
    // We need two methods
    
    // This gets called once for each item in the component's data source
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // The iOS runtime passes in the "component" and
        // "row" number that is being rendered
        return cities[row]
    }
    
    // This gets called whenever the picker is changed by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // The iOS runtime passes in the "component" that changed
        // and the "row" number that is now selected
        
        // Update the result label - always go back to the data source
        // (do not attempt to use or get the data from the picker)
        result.text = "I live in \(cities[row])"
    }
    
    // Actions
    
    // Ah, there's no "action" from a UIPickerView
    // Must use delegate methods
    
}

