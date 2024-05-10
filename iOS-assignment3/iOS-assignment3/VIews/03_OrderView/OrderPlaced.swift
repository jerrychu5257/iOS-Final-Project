//
//  OrderPlaced.swift
//  iOS-assignment3
//
//  Created by Prince Panchal on 5/5/2024.
//

import SwiftUI

struct CheckoutScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Text("Successful order")
                .font(.title)
                .foregroundColor(.green)
            
            Text("Your order is successfully sent")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true) // Hide the navigation bar if this is a full-screen modal or similar
    }
}

struct CheckoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutScreen()
    }
}

