//
//  RestaurantModel.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/1.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var rating: Float
    var deliveryTime: Int
    var lowestPrice: Float
}
