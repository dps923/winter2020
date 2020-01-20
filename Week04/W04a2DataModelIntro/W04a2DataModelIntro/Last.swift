//
//  Last.swift
//  W04a2DataModelIntro
//
//  Created by Peter McIntyre on 2019-09-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class Last: UIViewController {
    
    // Variables
    
    var incomingData: String!
    
    var course: Course!
    
    // Outlets

    @IBOutlet weak var result: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        result.text = "First course code is \(course.courseCode)"
    }
}
