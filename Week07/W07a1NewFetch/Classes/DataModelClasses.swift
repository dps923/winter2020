//
//  DataModelClasses.swift
//  W07a1NewFetch
//
//  Created by Peter McIntyre on 2019-10-09.
//  Copyright © 2019 SICT. All rights reserved.
//

import Foundation

// Course shape
class Course: Codable {
    var id: Int
    var courseCode: String
    var courseName: String
}

// Package shape
class CoursePackage: Codable {
    var student: String
    var version: String
    var timestamp: Date     // The decoder must be configured for ISO8601
    var count: Int
    var data: [Course]
}
