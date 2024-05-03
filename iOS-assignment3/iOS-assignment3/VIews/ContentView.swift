//
//  ContentView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var system: System
    
    var body: some View {
        VStack {
            TabView{
                HomeView()
                    .tabItem {
                        Image("icon_Home")
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        Image("icon_Search")
                        Text("Search")
                    }
                OrdersView()
                    .tabItem {
                        Image("icon_Shopping cart")
                        Text("Order")
                    }
                    .badge(system.orderbadge)
                BudgetView()
                    .tabItem {
                        Image("icon_Wallet")
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

#Preview {
    ContentView()
        .environmentObject(System())
}
