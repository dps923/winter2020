//
//  Shapes.swift
//  W03a5Shapes4
//
//  Created by Peter McIntyre on 2019-09-18.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class Shapes: UIViewController {
    
    // Variables
    
    // Outlets
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func toggleFred(_ sender: UISwitch) {
        
        if sender.isOn {
            
            // Get the image
            let image = UIImage(named: "fred-flintstone")!
            
            // Create a shape, first two arguments are relative to the upper-left corner
            // The last two arguments are the x-width and the y-height
            let newShape = Shape(frame: CGRect(x: 70, y: 140, width: image.size.width, height: image.size.height))
            // Pass the image to the new 'Shape' object
            newShape.shape = image
            newShape.tag = 1
            
            // Add the new shape to the view
            self.view.addSubview(newShape)
            
        } else {
            
            // Locate the shape to be removed
            let shapeToBeRemoved = self.view.viewWithTag(1)!
            // Remove the shape
            shapeToBeRemoved.removeFromSuperview()
        }
    }
    
    @IBAction func toggleWilma(_ sender: UISwitch) {
        
        if sender.isOn {
            let image = UIImage(named: "wilma-flintstone")!
            let newShape = Shape(frame: CGRect(x: 300, y: 100, width: image.size.width, height: image.size.height))
            newShape.shape = image
            newShape.tag = 2
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(2)!
            shapeToBeRemoved.removeFromSuperview()
        }
    }
    
    @IBAction func togglePebbles(_ sender: UISwitch) {
        
        if sender.isOn {
            let image = UIImage(named: "pebbles-flintstone")!
            let newShape = Shape(frame: CGRect(x: 370, y: 220, width: image.size.width, height: image.size.height))
            newShape.shape = image
            newShape.tag = 3
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(3)!
            shapeToBeRemoved.removeFromSuperview()
        }
    }
    
}
