//
//  BudgetView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct BudgetView: View {
    @State private var isEditingBudget = false
    @State private var totalBudget: String = "0 dollar / month"
    
    var expenses = DailyExpense.sampleData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Your Total Budget")
                                .font(.custom("headline", fixedSize: 20))
                                .padding()
                        Button(action: {
                            self.isEditingBudget.toggle()
                        }) {
                            Text("⍰")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .padding()
                    
                        Spacer()
                        Button(action: {
                            self.isEditingBudget.toggle()
                        }) {
                            Image(systemName: "pencil")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .padding()
                    }
                    Text(totalBudget)
                        .foregroundStyle(.white)
                        .padding()
                        .font(.custom("title", fixedSize: 18))
                        .frame(maxWidth: 250)
                        .background(.gray)
                        .cornerRadius(50)
                        
                        
                    .padding(.horizontal)

                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Your Current Budget")
                                .font(.custom("headline", fixedSize: 20))
                                .padding()
                            Text("XXXX dollar / month")
                                .foregroundStyle(.white)
                                .padding()
                                .font(.custom("title", fixedSize: 18))
                                .frame(maxWidth: 250)
                                .background(.gray)
                                .cornerRadius(50)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)

                Text("Daily Expense")
                    .font(.headline)
                    .padding(.horizontal)

                List(expenses) { expense in
                                HStack {
                                    Image(systemName: expense.iconName) // Ensure your icon names are compatible with SF Symbols or use custom images
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .padding(.trailing, 8)
                                    
                                        Text(expense.description)
                                        Spacer()
                                        Text("$\(expense.cost)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                   
                                    Spacer()
                                }
                                .listRowSeparator(.hidden)
                            }
                .listRowSeparator(.hidden)
                .listStyle(PlainListStyle())
                

            }
            .navigationTitle("Budget")
            .toolbar {
                NavigationLink(destination: EditBudgetView(totalBudget: totalBudget), isActive: $isEditingBudget) {
                    EmptyView()
                }
            }
        }
        .padding(6)
    }
}

#Preview {
    BudgetView()
}
