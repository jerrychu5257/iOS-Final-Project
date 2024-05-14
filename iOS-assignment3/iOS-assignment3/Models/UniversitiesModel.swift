//
//  UniversitiesModel.swift
//  iOS-assignment3
//
//  Created by YUN on 10/5/2024.
//

import Foundation
struct University {
    var location: String
    var names: [String]
}

// Example data
let universities = [
    University(location: "NSW", names: ["UTS", "UNSW", "University of Sydney"]),
    University(location: "VIC", names: ["University of Melbourne", "Monash University"])
]
