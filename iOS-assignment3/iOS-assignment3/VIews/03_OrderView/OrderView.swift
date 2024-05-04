//
//  OrderView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct OrdersView: View {
    @EnvironmentObject var system: System
    var body: some View {
        NavigationView {
            VStack {
                // Order Summary Section
                VStack(alignment: .leading) {
                    HStack {
                        Image(system.restaurantOrder.image ) // Replace with 'Image("YourImageName")' to use a custom image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .background(Color.gray)
                                                .cornerRadius(8)

                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(system.restaurantOrder.name)
                                                    .font(.headline)
                                                    .fontWeight(.bold)
                                                
                                                Text("\(system.orderItemsAmount) item ")
                                                    .font(.subheadline)
                                                
                                                Text("Deliver To : UTS Building 11")
                                                    .font(.subheadline)
                                                    .padding(.top, 2)
                                            }
                        
                        Spacer()
                        
                        Button(action: {
                            // Action for delete button
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
                                                .foregroundColor(.black)
                                                .background(Color.gray)
                                                .cornerRadius(8)
                                        }
                                        .padding(.horizontal)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                    .padding()

                NavigationLink(destination: AddOrderManuallyView()) {
                    Text("Add Order Manually")
                        .frame(minWidth: 290, maxWidth:30)
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
    var body: some View {
        VStack {
            // Contents of the Add Order Manually View
            Text("This is the Add Order Manually Screen.") // Placeholder for actual UI components
                .navigationBarTitle("Add Order Manually", displayMode: .inline)
            // Add your form or other UI elements here.
        }
    }
struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
            .environmentObject(System())
    }
}






