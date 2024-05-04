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
    @State private var restaurantName: String = ""
    @State private var itemName: String = ""
    @State private var itemAmount: String = ""
    @State private var price: String = ""
    // State to manage navigation programmatically
    @State private var shouldNavigateToOrders = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Restaurant Name")
                .font(.headline)
                .padding(.horizontal)
            TextField("Enter restaurant name", text: $restaurantName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Item Name")
                .font(.headline)
                .padding(.horizontal)
            TextField("Enter item name", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Item Amount")
                .font(.headline)
                .padding(.horizontal)
            TextField("Enter item amount", text: $itemAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Price")
                .font(.headline)
                .padding(.horizontal)
            TextField("Enter price", text: $price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Spacer()
            
            // Invisible NavigationLink activated by the shouldNavigateToOrders state
            NavigationLink(destination: OrdersScreen(), isActive: $shouldNavigateToOrders) { EmptyView() }

            Button("Add") {
                // Validate and add the order
                if let amount = Int(itemAmount), let itemPrice = Double(price) {
                    orderManager.addOrder(restaurantName: restaurantName, itemName: itemName, itemAmount: amount, price: itemPrice)
                    // Clear the text fields after adding the order
                    restaurantName = ""
                    itemName = ""
                    itemAmount = ""
                    price = ""
                    // Trigger navigation to OrdersScreen
                    shouldNavigateToOrders = true
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal)
        }
        .navigationBarTitle("Add Order Manually", displayMode: .inline)
    }
}

struct AddOrderManuallyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddOrderManuallyView().environmentObject(OrderManager())
        }
    }
}

