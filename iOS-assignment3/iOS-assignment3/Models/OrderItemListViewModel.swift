//
//  OrderViewModel.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/3.
//

import Foundation

class OrderItemListViewModel: ObservableObject{
    @Published var orderItems: [RestaurantOrderItem] = []
    
    init(){
        orderItems = orderItemData
    }
    
    func addOrderItem(){
        
    }
}

let orderItemData = [
    RestaurantOrderItem(image: "image_item_Cheese Burger", name: "Cheese Burger", price: 14.5, amount: 0),
    RestaurantOrderItem(image: "image_item_Classic Angus", name: "Classic Angus", price: 13.5, amount: 0),
    RestaurantOrderItem(image: "image_item_Fried Chicken Burger", name: "Fried Chicken Burger", price: 10, amount: 0),
    RestaurantOrderItem(image: "image_item_Grilled Chicken Burger", name: "Grilled Chicken Burger", price: 11.5, amount: 0),
    RestaurantOrderItem(image: "image_item_BBQ Bacon Burger", name: "BBQ Bacon Burger", price: 14, amount: 0),
    RestaurantOrderItem(image: "image_item_French Fries", name: "French Fries", price: 6, amount: 0),
    RestaurantOrderItem(image: "image_item_Onion Rings", name: "Onion Rings", price: 7, amount: 0),
    RestaurantOrderItem(image: "image_item_Chicken Strips", name: "Chicken Strips", price: 6, amount: 0),
    RestaurantOrderItem(image: "image_item_Coke", name: "Coca-Cola", price: 4, amount: 0),
    RestaurantOrderItem(image: "image_item_Fanta", name: "Fanta", price: 4.5, amount: 0),
    RestaurantOrderItem(image: "image_item_Orange Juice", name: "Orange Juice", price: 3.5, amount: 0)
]
