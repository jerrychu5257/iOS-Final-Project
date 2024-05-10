//
//  OrderView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct OrdersView: View {
    @EnvironmentObject var system: System  // Assuming this has information like restaurantOrder
    @EnvironmentObject var orderManager: OrderManager  // Manages multiple orders

    var body: some View {
        NavigationView {
            VStack {
                // Featured Order Summary Section
                VStack(alignment: .leading) {
                    HStack {
                        Image(system.restaurantOrder.image)  // Use a placeholder or actual image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(system.restaurantOrder.name)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("\(system.orderItemsAmount) item")
                                .font(.subheadline)
                            Text("Deliver To: UTS Building 11")
                                .font(.subheadline)
                                .padding(.top, 2)
                        }

                        Spacer()

                        Button(action: {
                            // Action to delete the featured order
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()

                    NavigationLink(destination: ViewCartScreen()) {
                        Text("View Cart")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding()

                // List of All Orders
                List(orderManager.orders) { order in
                    VStack(alignment: .leading) {
                        Text(order.restaurantName)
                            .font(.headline)
                        Text(order.itemName)
                            .font(.subheadline)
                        Text("Amount: \(order.itemAmount)")
                        Text("Price: $\(order.price, specifier: "%.2f")")
                    }
                }
                .listStyle(PlainListStyle())

                NavigationLink(destination: AddOrderManuallyView()) {
                    Text("Add Order Manually")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .padding([.horizontal, .bottom])

                Spacer()
            }
            .background(Color.white)
            .navigationBarTitle("Orders", displayMode: .inline)
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
            .environmentObject(System())
            .environmentObject(OrderManager())
    }
}







