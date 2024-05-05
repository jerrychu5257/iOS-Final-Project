//
//  ViewCart.swift
//  iOS-assignment3
//
//  Created by Prince Panchal on 2/5/2024.
//

import SwiftUI

struct ViewCartScreen: View {
    @EnvironmentObject var system: System
    @State private var navigateToCheckout = false

    var body: some View {
        NavigationView {
            VStack {
                Text(system.restaurantOrder.name)
                    .font(.title)
                    .padding()

                ForEach(0..<system.orderItems.count, id: \.self){index in
                    HStack {
                        Image(system.orderItems[index].image)  // Ensure the image is in your assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(system.orderItems[index].name)
                                .font(.headline)
                            Text("Item amount: 1")
                            Text("Price: $\(system.orderItems[index].price, specifier: "%.2f")")
                        }

                        Spacer()

                        Button(action: {
                            system.removeItem(id: system.orderItems[index].id)
                        }) {
                            Image(systemName: "trash")
                        }
                        .foregroundColor(.black)

                        Button(action: {
                            system.addItem(id: system.orderItems[index].id)
                        }) {
                            Image(systemName: "plus")
                        }
                        .foregroundColor(.black)
                    }
                }

                HStack {
                    Text("Subtotal")
                        .font(.headline)
                    Spacer()
                    Text("$\(system.orderItemsTotalPrice, specifier: "%.2f")")
                        .font(.headline)
                }
                .padding()

                Button("Checkout") {
                    system.orderbadge = 0
                    navigateToCheckout = true
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(8)
                .padding()
                NavigationLink("", destination: CheckoutScreen(), isActive: $navigateToCheckout)
            }
            .navigationBarTitle("View Cart", displayMode: .inline)
        }
    }
}
struct ViewCartScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewCartScreen().environmentObject(System())
        }
    }
}

