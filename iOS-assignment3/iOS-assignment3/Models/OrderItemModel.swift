//
//  OrderModel.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/3.
//

import Foundation

struct RestaurantOrderItem: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var price: Float
    var amount: Int
}
