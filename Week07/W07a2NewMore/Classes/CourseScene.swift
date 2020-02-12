//
//  CourseScene.swift
//  W07a1NewFetch
//
//  Created by Peter McIntyre on 2019-10-09.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class CourseScene: UIViewController {

    // MARK: - Variables
    
    var course: Course!
    var m: DataModelManager!

    // MARK: - Outlets
    
    @IBOutlet weak var courseCode: UILabel!
    
    @IBOutlet weak var courseName: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        courseCode.text = course.courseCode
        courseName.text = course.courseName
    }

    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPost" {
            
            // Get a reference to the next controller
            let vc = segue.destination as? TypicodePost
            
            // Pass on the data model manager
            vc?.m = self.m
        }
    }
}
