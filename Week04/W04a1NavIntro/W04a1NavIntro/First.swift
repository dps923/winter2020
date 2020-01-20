//
//  First.swift
//  W04a1NavIntro
//
//  Created by Peter McIntyre on 2019-09-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class First: UIViewController {

    // Variables
    
    // Outlets
    
    @IBOutlet weak var result: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.text = "Scene 1 of 3"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toNext" {
            
            // Get a reference to the destination view controller
            let vc = segue.destination as! Next
            
            // Pass on the data
            vc.incomingData = "Second scene (of 3)"
        }
    }
}

