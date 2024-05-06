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
    @Published var orderItemsTotalPrice: Float = 0.0
    @Published var orders: [OrderModel] = []
    
    struct CartItem: Identifiable {
            let id: UUID = UUID()
            var name: String
            var amount: Int
            var price: Double
        }
    func addItem(id: UUID) {
            if let index = orderItems.firstIndex(where: { $0.id == id }) {
                orderItems[index].amount += 1
                orderItemsTotalPrice += orderItems[index].price  // Assuming price stays constant and you just need to recalculate the total
            }
        }

        func removeItem(id: UUID) {
            if let index = orderItems.firstIndex(where: { $0.id == id }) {
                if orderItems[index].amount > 0 {
                    orderItems[index].amount -= 1
                    orderItemsTotalPrice -= orderItems[index].price
                }
                if orderItems[index].amount == 0 {
                    orderItems.remove(at: index)
                }
            }
        }
    }
    
