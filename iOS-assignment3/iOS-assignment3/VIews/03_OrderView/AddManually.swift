//
//  File.swift
//  iOS-assignment3
//
//  Created by Prince Panchal on 2/5/2024.
//

import SwiftUI
struct Order: Identifiable {
    let id: UUID = UUID()
    let restaurantName: String
    let itemName: String
    let itemAmount: Int
    let price: Double
}

// Define the OrderManager class
class OrderManager: ObservableObject {
    @Published var orders: [Order] = []
    
    func addOrder(restaurantName: String, itemName: String, itemAmount: Int, price: Double) {
        let newOrder = Order(restaurantName: restaurantName, itemName: itemName, itemAmount: itemAmount, price: price)
        orders.append(newOrder)
    }
}
struct AddOrderManuallyView: View {
    @EnvironmentObject var orderManager: OrderManager
    @Environment(\.presentationMode) var presentationMode
    @State private var restaurantName: String = ""
    @State private var itemName: String = ""
    @State private var itemAmount: String = ""
    @State private var price: String = ""
    @State private var navigateToOrdersView = false
    
    var body: some View {
            VStack(alignment: .leading, spacing: 55) {
                TextField("Restaurant Name", text: $restaurantName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing])
                
                TextField("Item Name", text: $itemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing])
                
                TextField("Item Amount", text: $itemAmount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing])
                
                TextField("Price", text: $price)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing])
                
                Button("Add") {
                    if let amount = Int(itemAmount), let itemPrice = Double(price) {
                        orderManager.addOrder(restaurantName: restaurantName, itemName: itemName, itemAmount: amount, price: itemPrice)
                        restaurantName = ""
                        itemName = ""
                        itemAmount = ""
                        price = ""
                        navigateToOrdersView = true // Setting the navigation trigger
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                .foregroundColor(.black)
                .cornerRadius(8)
                .padding([.leading, .trailing])
                
                
//                NavigationLink(destination: OrdersView(), isActive: $navigateToOrdersView) {
//                    EmptyView()
//                }
            }
            .navigationBarTitle("Add Order Manually", displayMode: .inline)
        }
        
    }
    
    
    struct AddOrderManuallyView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                AddOrderManuallyView()
                    .environmentObject(System())
                    .environmentObject(OrderManager()) // Injecting the OrderManager environment object
            }
        }
    }


