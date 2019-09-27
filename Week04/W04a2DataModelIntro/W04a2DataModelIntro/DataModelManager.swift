//
//  File.swift
//  W04a2DataModelIntro
//
//  Created by Peter McIntyre on 2019-09-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import Foundation

class DataModelManager {
    
    // Variables (public properties, and private variables)
    
    private var btp500: Course
    private var bts530: Course
    private var dps923: Course
    private var package: PackageCourses
    
    // MARK: - Lifecycle
    
    // Class initializer
    init() {
        
        // Create three course objects
        btp500 = Course(id: 46, courseCode: "BTP500", courseName: "Data Structures and Algorithms")
        bts530 = Course(id: 53, courseCode: "BTS530", courseName: "Capstone Project - Planning")
        dps923 = Course(id: 93, courseCode: "DPS923", courseName: "iOS Programming")
        
        // Create course package
        package = PackageCourses(student: "Peter McIntyre", version: "1.0.0", timestamp: Date(), count: 3, data: [btp500, bts530, dps923])
    }

    // Get the course package
    func CoursePackageGet() -> PackageCourses {
        
        return package
    }
}
