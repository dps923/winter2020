//
//  ViewController.swift
//  AppWithErrors
//
//  Created by Peter McIntyre on 2018-09-18.
//  Copyright © 2018 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instance variables
    
    // MARK: - Outlets
    
    @IBOutlet weak var resultText: UILabel!
    
    @IBOutlet weak var userName: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // This function is from the Swift documentation
    // https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID164
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        
        // There are three forms of the "for" statement
        // The first one is correct
        // The other two have range problems and will cause errors
        // See here for info on range operators
        // https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID73
        
        //for value in array[1..<array.count] {
        for value in array[1...array.count] {
        //for value in array[0...array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }

    // MARK: - Actions
    
    @IBAction func generateGreeting(_ sender: UIButton) {

        // Call the function
        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
        
        // Output
        print("min is \(bounds.min) and max is \(bounds.max)")
        resultText.text = "min is \(bounds.min) and max is \(bounds.max)"

    }
    
}

