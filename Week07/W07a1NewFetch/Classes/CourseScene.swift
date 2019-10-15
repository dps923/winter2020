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
    
    // MARK: - Outlets
    
    @IBOutlet weak var courseCode: UILabel!
    
    @IBOutlet weak var courseName: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        courseCode.text = course.courseCode
        courseName.text = course.courseName
    }

}
