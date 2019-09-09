//
//  ViewController.swift
//  W01a1Label
//
//  Created by Peter McIntyre on 2019-09-09.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables

    var labelText = "App"
    
    // Outlets
    
    @IBOutlet weak var topLabel: UILabel!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //topLabel.text = labelText
        topLabel.text = setLabelText(text: "Peter's")
    }
    
    // New function
    func setLabelText(text: String) -> String {
        return "This is \(text) \(labelText)"
    }

    // Actions

}


