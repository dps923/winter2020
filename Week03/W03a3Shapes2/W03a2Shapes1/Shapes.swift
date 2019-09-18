//
//  Shapes.swift
//  W03a3Shapes2
//
//  Created by Peter McIntyre on 2019-09-17.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class Shapes: UIViewController {

    // Variables
    
    // Outlets
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func toggleSquare(_ sender: UISwitch) {
        
        if sender.isOn {
            
            // Create a shape, first two arguments are relative to the upper-left corner
            // The last two arguments are the x-width and the y-height
            let newShape = Shape(frame: CGRect(x: 20, y: 210, width: 100, height: 100))
            
            // Configure the properties
            newShape.shapeType = "Square"
            newShape.shapeColor = UIColor.orange.cgColor
            newShape.tag = 1
            
            // Add the new shape to the view
            self.view.addSubview(newShape)
        } else {
            
            // Locate the shape to be removed
            let shapeToBeRemoved = self.view.viewWithTag(1)
            // Remove the shape
            shapeToBeRemoved?.removeFromSuperview()
        }
    }
    
    @IBAction func toggleRectangle(_ sender: UISwitch) {
        
        if sender.isOn {
            let newShape = Shape(frame: CGRect(x: 60, y: 250, width: 100, height: 225))
            newShape.shapeType = "Rectangle"
            newShape.shapeColor = UIColor.red.cgColor
            newShape.tag = 2
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(2)
            shapeToBeRemoved?.removeFromSuperview()
        }
    }
    
    @IBAction func toggleCircle(_ sender: UISwitch) {
        
        if sender.isOn {
            let newShape = Shape(frame: CGRect(x: 100, y: 290, width: 150, height: 150))
            newShape.shapeType = "Circle"
            newShape.shapeColor = UIColor.magenta.cgColor
            newShape.tag = 3
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(3)
            shapeToBeRemoved?.removeFromSuperview()
        }
    }
    
    @IBAction func toggleEllipse(_ sender: UISwitch) {
        
        if sender.isOn {
            let newShape = Shape(frame: CGRect(x: 140, y: 330, width: 225, height: 100))
            newShape.shapeType = "Ellipse"
            newShape.shapeColor = UIColor.blue.cgColor
            newShape.tag = 4
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(4)
            shapeToBeRemoved?.removeFromSuperview()
        }
    }
    
}

