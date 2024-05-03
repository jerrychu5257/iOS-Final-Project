//
//  SystemModel.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/2.
//

import Foundation

class System: ObservableObject{
    // badges
    @Published var orderbadge = 0
    @Published var budgetbadge = 0
    
    // orders
    @Published var restaurantOrder: Restaurant = Restaurant(image: "", name: "", rating: 0.0, deliveryTime: 0, lowestPrice: 0.0)
    @Published var orderItems: [RestaurantOrderItem] = []
    @Published var orderItemsAmount: Int = 0
    

}
