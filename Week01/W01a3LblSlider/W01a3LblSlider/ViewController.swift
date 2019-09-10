//
//  ViewController.swift
//  W01a3LblSlider
//
//  Created by Peter McIntyre on 2019-09-10.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables
    
    // Outlets
   
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var theSlider: UISlider!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Display the slider value
        //sliderValue.text = String(format: "%1.2f", theSlider.value)
        // After refactor
        updateSliderValue(value: theSlider.value)
        
        // Set the background colour
        updateBackgroundColour(sliderValue: theSlider.value)
    }

    func updateSliderValue(value: Float) {
        sliderValue.text = String(format: "%1.2f", value)
    }
    
    func updateBackgroundColour(sliderValue: Float) {

        // The UIColor initializer wants parameter values
        // between 0.0 and 1.0, so the calculation below
        // ensures that the values are in the range
        // This calculation was done by trial and error
        self.view.backgroundColor = UIColor(red: CGFloat(sliderValue * 1.5)/255.0, green: CGFloat(sliderValue * 0.2)/255.0, blue: CGFloat(sliderValue * 0.6)/255.0, alpha: 0.8)

    }
    
    // Actions
    
    @IBAction func sliderChanged(_ sender: UISlider) {

        // Update the slider value
        //sliderValue.text = String(format: "%1.2f", theSlider.value)
        // After refactor
        updateSliderValue(value: theSlider.value)
        
        // Set the background colour
        updateBackgroundColour(sliderValue: theSlider.value)
    }
    

}

