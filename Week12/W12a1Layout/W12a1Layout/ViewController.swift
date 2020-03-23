//
//  ViewController.swift
//  W12a1Layout
//
//  Created by Peter McIntyre on 2019-11-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var image: UIImageView!
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the image view to a photo in the assets catalog
        self.image.image = UIImage(named: "img.png")
    }
}

