//
//  AddorderModel.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/5.
//

import Foundation

struct OrderModel: Identifiable {
    // orders
    var id = UUID()
    var image: String = ""
    var name = ""
    var itemName = ""
    var itemAmount:Int = 0
    var price:Float = 0

}
