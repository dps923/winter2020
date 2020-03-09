//
//  PersonScene.swift
//  W09a2LoadV2
//
//  Created by Peter McIntyre on 2019-11-10.
//  Copyright © 2019 SICT. All rights reserved.
//
//  This is a standard view controller
//  It is within a navigation workflow, with a presenter, and a maybe a successor
//

import UIKit

// Adopt the protocols that are appropriate for this controller (detail, add, etc.)

class PersonScene: UIViewController {
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!

    // Passed-in object
    var item: Person!
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var exampleName: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleName.text = "\(item.firstName ?? "(none)") \(item.lastName ?? "(none)")"
    }
    
}
