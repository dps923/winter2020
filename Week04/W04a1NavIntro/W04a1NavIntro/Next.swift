//
//  Next.swift
//  W04a1NavIntro
//
//  Created by Peter McIntyre on 2019-09-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class Next: UIViewController {

    // Variables
    
    var incomingData: String!
    
    // Outlets
    
    @IBOutlet weak var result: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.text = incomingData
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toLast" {
            
            // Get a reference to the destination view controller
            let vc = segue.destination as! Last
            
            // Pass on the data
            vc.incomingData = "We're done, scene 3 of 3"
        }
    }
}
