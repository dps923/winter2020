//
//  Last.swift
//  W04a1NavIntro
//
//  Created by Peter McIntyre on 2019-09-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class Last: UIViewController {
    
    // Variables
    
    var incomingData: String!
    
    // Outlets

    @IBOutlet weak var result: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        result.text = incomingData
    }
}
