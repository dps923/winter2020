//
//  First.swift
//  W04a2DataModelIntro
//
//  Created by Peter McIntyre on 2019-09-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class First: UIViewController {

    // Variables
    
    var m: DataModelManager!
    
    private var coursePackage: PackageCourses!
    
    // Outlets
    
    @IBOutlet weak var result: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coursePackage = m.CoursePackageGet()
        
        result.text = "Scene 1, for \(coursePackage.student)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toNext" {
            
            // Get a reference to the destination view controller
            let vc = segue.destination as! Next
            
            // Pass on the data
            vc.coursePackage = coursePackage
        }
    }
}

