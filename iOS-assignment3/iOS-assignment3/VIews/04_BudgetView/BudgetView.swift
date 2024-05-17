//
//  BudgetView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct BudgetView: View {
    
    @EnvironmentObject var system: System
    @State private var isEditingBudget = false
    @State private var totalBudget: String = "0 dollar / month"
    @State private var showingOfferView = false
    
    var expenses = DailyExpense.sampleData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
                        Image(systemName: "person.text.rectangle.fill")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    HStack {
                        Text("Total Budget")
                            .bold()
                            .font(.custom(
                                "ArialRoundedMTBold",
                                fixedSize: 20))
                            .padding(.bottom, -5)
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
                    Text("\(system.totalBudget) dollar / month")
                        .foregroundStyle(.white)
                        .padding()
                        .font(.system(size: 18, design: .rounded))
                        .bold()
                        .frame(maxWidth: 280)
                        .background(Color(UIColor(red: 240/255, green: 140/255, blue: 30/255, alpha: 1)))
                        .cornerRadius(50)
                        .offset(x: 35, y: -5)
                        
                    
                    .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Current Budget")
                                .bold()
                                .font(.custom(
                                    "ArialRoundedMTBold",
                                    fixedSize: 20))
                                .padding(.bottom, 10)
                            Text("\(system.currentBudget) dollar")
                                .foregroundStyle(.white)
                                .padding()
                                .font(.system(size: 18, design: .rounded))
                                .bold()
                                .frame(maxWidth: 280)
                                .background(Color(UIColor(red: 240/255, green: 140/255, blue: 30/255, alpha: 1)))
                                .cornerRadius(50)
                                .offset(x: 35, y: -5)
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
                        Image(expense.iconName) // Ensure your icon names are compatible with SF Symbols or use custom images
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(.trailing, 8)
                        
                        Text(expense.description)
                        Spacer()
                        Text("$\(expense.cost)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                       
                    }
                    .listRowSeparator(.hidden)
                }
                .listRowSeparator(.hidden)
                .listStyle(PlainListStyle())
                

            }
            .ignoresSafeArea()
            .navigationBarTitle("Budget", displayMode: .inline)
            .toolbar {
                NavigationLink(destination: EditBudgetView(), isActive: $isEditingBudget) {
                    EmptyView()
                }
            }
            .fullScreenCover(isPresented: $showingOfferView) {
                            OfferView()  // Present OfferView as a full-screen cover
            }
        }
        .padding(6)
    }
}

#Preview {
    BudgetView()
        .environmentObject(System())
}
