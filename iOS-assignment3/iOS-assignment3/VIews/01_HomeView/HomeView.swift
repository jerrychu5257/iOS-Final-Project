//
//  HomeView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct HomeView: View {
    var orderbefore = OrderAgain.sampleData
    var recommendations = Recommendation.sampleData
    
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // User Information Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Welcome 🙌")
                            Text("User Name")
                                .font(.system(size: 36, weight: .black, design: .serif))
                                
                            Text("Address: XXXXXXX")
                                .foregroundStyle(.white)
                                .padding()
                                .font(.custom("title", fixedSize: 18))
                                .frame(maxWidth: 300, maxHeight: 35)
                                .background(.gray)
                                .cornerRadius(50)
                                .opacity(0.7)
                            Text("Budget: XXXX dollar/month")
                        }
                        .padding()

                        // Order Again Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Order Again")
                                .font(.headline)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(orderbefore) { order in
                                        VStack {
                                            Image(order.iconName)
                                                
                                                .resizable()
                                                                            .scaledToFit().frame(width: 100, height: 100)
                                                .foregroundColor(.gray)
                                            Text("food name")
                                            Text("Price: XX$")
                                        }
                                    }
                                }
                            }
                        }
                        .padding()

                        // Recommendations Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Recommendations")
                                .font(.headline)
                            ForEach(recommendations) { order in
                                HStack {
                                    Image(order.iconName)
                                        
                                        .resizable()
                                        .scaledToFit().frame(width: 100, height: 100)
                                    VStack(alignment: .leading) {
                                        Text("restaurant name ")
                                        Text("food")
                                    }
                                    .frame(width: 160, height: 30 )
                                    Text("XX$")
                                        .frame(width: 50, height: 30 )
                                }
                            }
                        }
                        .padding()
                    }
                }
                .padding(6)
            }


    }



#Preview {
    HomeView()
}
