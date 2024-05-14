//
//  EditBudgetView.swift
//  iOS-assignment3
//
//  Created by YUN on 4/5/2024.
//

import SwiftUI

struct EditBudgetView: View {
    
    @EnvironmentObject var system: System
    @State private var budgetInput: String = ""

    
    var body: some View {
        VStack {
            TextField("Enter amount to add", text: $budgetInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Submit") {
                system.totalBudget = Int(budgetInput)!
//                if let amountToAdd = Int(budgetInput) {
//                let currentBudget = Int(totalBudget.components(separatedBy: " ").first ?? "0") ?? 0
//                let newBudget = currentBudget + amountToAdd
//                totalBudget = "\(newBudget) dollar / month"
//              }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
            .foregroundColor(.black)
            .cornerRadius(10)
        }
        .navigationTitle("Edit Budget")
        .navigationBarItems(leading: Button("Back") {
            // Logic to dismiss view
        })
    }
}

#Preview {
    EditBudgetView()
        .environmentObject(System())
}
