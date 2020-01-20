//
//  DataModelClasses.swift
//  W04a2DataModelIntro
//
//  Created by Peter McIntyre on 2019-09-27.
//  Copyright © 2019 SICT. All rights reserved.
//

import Foundation

// Course shape
struct Course: Codable {
    let id: Int
    let courseCode: String
    let courseName: String
}

// Package shape
struct PackageCourses: Codable {
    let student: String
    let version: String
    let timestamp: Date     // The decoder must be configured for ISO8601
    let count: Int
    var data: [Course]
}
