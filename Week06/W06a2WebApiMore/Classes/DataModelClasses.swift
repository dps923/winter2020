//
//  DataModelClasses.swift
//  W06a1FetchIntro
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

// Typicode.com data shapes

// Post
class TCPost: Codable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
    
    init(id: Int, userId: Int, title: String, body: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}

// Album
class TCAlbum: Codable {
    var id: Int
    var userId: Int
    var title: String
}

// Photo
class TCPhoto: Codable {
    var id: Int
    var albumId: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
