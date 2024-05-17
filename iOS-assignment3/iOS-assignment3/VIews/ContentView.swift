//
//  ContentView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var system: System  // This will access the provided System object

    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                            
                            .foregroundColor(.appOrange)
                        Text("Home")
                        
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                OrdersView()
                    .tabItem {
                        Image(systemName: "cart.fill")  // Use SF Symbols for consistency
                        Text("Order")
                    }
                    .badge(system.orderbadge)
                BudgetView()
                    .tabItem {
                        Image(systemName: "wallet.pass.fill")  // Use SF Symbols for consistency
                        Text("Budget")
                    }
                    .badge(system.budgetbadge)
            }
            
            .background(Color.gray)
        }
        .padding()
        .ignoresSafeArea()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(System())  // Continue to provide any other required EnvironmentObjects
            .environmentObject(OrderManager())  // Providing OrderManager instance
            .preferredColorScheme(.light)
    }
}

