//
//  ViewCart.swift
//  iOS-assignment3
//
//  Created by Prince Panchal on 2/5/2024.
//

import SwiftUI

struct ViewCartScreen: View {
    // Sample data for cart items
    struct CartItem {
        let id: Int
        let name: String
        let amount: Int
        let price: Double
    }
    
    let cartItems: [CartItem] = [
        .init(id: 0, name: "Burger", amount: 1, price: 9.99),
        .init(id: 1, name: "Fries", amount: 1, price: 19.98),
        .init(id: 2, name: "Coke", amount: 1, price: 29)
    ]
    
    var subtotal: Double {
        cartItems.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        VStack {
            Text("Restaurant Name")
                .font(.title)
                .padding()
            
            List(cartItems, id: \.id) { item in
                HStack {
                    Image(systemName: "photo") // Placeholder for the image, replace with actual image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text("Item amount: \(item.amount)")
                        Text("Price: \(item.price, specifier: "%.2f")")
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action for delete button
                    }) {
                        Image(systemName: "trash")
                    }
                    .foregroundColor(.black)
                    
                    Button(action: {
                        // Action for add button
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
                Text("\(subtotal, specifier: "%.2f") Dollar")
                    .font(.headline)
            }
            .padding()
            
            Button(action: {
                // Action for checkout button
            }) {
                Text("Checkout")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationBarTitle("View Cart", displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            // Action to dismiss the view or go back
        }) {
            
        })
    }
}

struct ViewCartScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewCartScreen()
        }
    }
}

//
//  File3.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/3.
//

import Foundation
