//
//  ExpenseRecordModel.swift
//  iOS-assignment3
//
//  Created by YUN on 4/5/2024.
//

import SwiftUI

struct DailyExpense: Identifiable {
    var id = UUID()
    var date : String
    var description: String
    var cost: String
    var iconName: String
    
}

// offers Data
extension DailyExpense {
    static let sampleData = [
        DailyExpense(date: "04 MAY 2024", description: "Margherita Pizza", cost: "15.00", iconName: "pizzaHut"),
        DailyExpense(date: "04 MAY 2024", description: "Kung Pao Chicken Rice", cost: "12.54", iconName: "pizzaHut"),
        DailyExpense(date: "04 MAY 2024",description: "Vegan Burrito Bowl", cost: "15.80", iconName: "pizzaHut"),
        DailyExpense(date: "04 MAY 2024",description: "Iced Latte", cost: "6.50", iconName: "pizzaHut"),
        
        DailyExpense(date: "03 MAY 2024", description: "Margherita Pizza", cost: "15.00", iconName: "pizzaHut"),
        DailyExpense(date: "03 MAY 2024", description: "Kung Pao Chicken Rice", cost: "12.54", iconName: "pizzaHut"),
        DailyExpense(date: "03 MAY 2024",description: "Vegan Burrito Bowl", cost: "15.80", iconName: "pizzaHut"),
        DailyExpense(date: "03 MAY 2024",description: "Iced Latte", cost: "6.50", iconName: "pizzaHut"),

    ]
}
