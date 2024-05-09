//
//  specialOffers.swift
//  iOS-assignment3
//
//  Created by YUN on 4/5/2024.
//

import Foundation

struct Promotion: Identifiable {
    var id = UUID()
    var title: String
    var expirationDate: String
    var iconName: String
}

// offers Data
extension Promotion {
    static let sampleData = [
        Promotion(title: "Free Medium Pizza", expirationDate: "04/06/24", iconName: "pizzaHut"),
        Promotion(title: "Free 6PC Wings", expirationDate: "04/06/24", iconName: "image_restaurant_MadMex"),
        Promotion(title: "40% OFF", expirationDate: "04/06/24", iconName: "image_restaurant_SushiWorld"),
        Promotion(title: "$7 OFF", expirationDate: "04/06/24", iconName: "image_restaurant_Subway")
    ]
}


struct OrderAgain: Identifiable {
    var id = UUID()
    var foodName: String
    var orderAgaiPrice: String
    var iconName: String
}


extension OrderAgain {
    static let sampleData = [
        OrderAgain(foodName: "Bean and vegetable burger", orderAgaiPrice: "20", iconName: "ThaiGreenCurry"),
        OrderAgain(foodName: "Creamy milkshake", orderAgaiPrice: "20", iconName: "eggRice"),
        OrderAgain(foodName: "Chicken Curry rice", orderAgaiPrice: "20", iconName: "mealPrep1"),
        OrderAgain(foodName: "Bean and vegetable burger", orderAgaiPrice: "20", iconName: "mealPrep2"),
        
    ]
}


struct Recommendation: Identifiable {
    var id = UUID()
    var foodName: String
    var orderAgaiPrice: String
    var iconName: String
}


extension Recommendation {
    static let sampleData = [
        Recommendation(foodName: "Bean and vegetable burger", orderAgaiPrice: "20", iconName: "bubbleTea"),
        Recommendation(foodName: "Creamy milkshake", orderAgaiPrice: "20", iconName: "image_food_Japanese"),
        Recommendation(foodName: "Chicken Curry rice", orderAgaiPrice: "20", iconName: "pizzaHut"),
        Recommendation(foodName: "Bean and vegetable burger", orderAgaiPrice: "20", iconName: "pizzaHut"),
        Recommendation(foodName: "Bean and vegetable burger", orderAgaiPrice: "20", iconName: "pizzaHut"),
        Recommendation(foodName: "Bean and vegetable burger", orderAgaiPrice: "20", iconName: "pizzaHut"),
        
        
    ]
}
