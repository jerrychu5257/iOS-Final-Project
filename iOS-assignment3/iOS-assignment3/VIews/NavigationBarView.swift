//
//  NavigationBarView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 400, height: 100)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.gray), alignment: .top)
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)){
                            VStack{
                                Image("icon_Home")
                                Text("Home")
                            }
                            .padding(.horizontal, 16)
                            .foregroundColor(.black)
                        }
                        NavigationLink(destination: SearchView().navigationBarBackButtonHidden(true)){
                            VStack{
                                Image("icon_Search")
                                Text("Search")
                            }
                            .padding(.horizontal, 16)
                            .foregroundColor(.black)
                        }
                        NavigationLink(destination: OrderView().navigationBarBackButtonHidden(true)){
                            VStack{
                                Image("icon_Shopping cart")
                                Text("Order")
                            }
                            .padding(.horizontal, 16)
                            .foregroundColor(.black)
                        }
                        NavigationLink(destination: BudgetView().navigationBarBackButtonHidden(true)){
                            VStack{
                                Image("icon_Wallet")
                                Text("Budget")
                            }
                            .padding(.horizontal, 16)
                            .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 16)
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationBarView()
}
