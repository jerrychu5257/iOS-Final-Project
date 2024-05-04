//
//  OrderScreen2.swift
//  iOS-assignment3
//
//  Created by Prince Panchal on 2/5/2024.
//

import SwiftUI

struct OrderItem: Identifiable {
    let id = UUID()
    let restaurantName: String
    let itemDescription: String
    let address: String
}

struct OrdersScreen: View {
    @State private var orders = [
        OrderItem(restaurantName: "Restaurant Name", itemDescription: "X item - Price", address: "Deliver to (Address)"),
        OrderItem(restaurantName: "Restaurant Name", itemDescription: "X item - Price", address: "Deliver to (Address)")
        // Add more orders as necessary
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(orders.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "photo.fill") // Replace with Image("YourImageName") for actual images
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text(orders[index].restaurantName)
                                        .font(.headline)
                                    Text(orders[index].itemDescription)
                                        .font(.subheadline)
                                    Text(orders[index].address)
                                        .font(.subheadline)
                                }
                                Spacer()
                                Button(action: {
                                    removeOrder(at: index)
                                }) {
                                    Image(systemName: "trash")
                                }
                            }
                            .padding()
                            
                            if index == 0 {
                                Button("View Cart") {
                                    // action to view cart
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(Color.black)
                                .cornerRadius(10)
                                .padding(.bottom)
                            } else {
                                Button("Add into Budget") {
                                    // action to add to budget
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(Color.black)
                                .cornerRadius(10)
                                .padding(.bottom)
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                    }
                    NavigationLink(destination: AddOrderManuallyView()) {
                        Button("Add Order Manually") {
                            // action to add order manually
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                        .padding()
                    }
                }
                .navigationBarTitle("Orders", displayMode: .inline)
            }
        }
    }
        func removeOrder(at index: Int) {
            orders.remove(at:index)
        }
    }

    struct OrdersScreen_Previews: PreviewProvider {
        static var previews: some View {
            OrdersScreen()
        }
    }




