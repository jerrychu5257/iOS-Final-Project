//
//  AddorderModel.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/5.
//

import Foundation

class OrderModel: ObservableObject{
    // orders
    @Published var restaurantName = ""
    @Published var itemName = ""
    @Published var itemAmount = ""
    @Published var price = ""
    
}
