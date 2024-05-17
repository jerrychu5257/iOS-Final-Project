//
//  HomeView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var system: System
    var orderbefore = OrderAgain.sampleData
    var recommendations = Recommendation.sampleData
    
    @State private var showingOfferView = false

    
    var body: some View {
        ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // User Information Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Welcome 🙌")
                            .font(.system(size: 16, weight: .black, design: .serif))
                        Text("Thomas Edison")
                            .font(.system(size: 27, weight: .black, design: .serif))
                        HStack{
                            Text("Budget:")
                                .font(.system(size: 16, weight: .black, design: .serif))
                            Text("\(system.currentBudget) ")
                                .font(.system(size: 20, weight: .heavy, design: .serif))
                                .foregroundStyle(.appOrange)
                            Text("  dollar")
                                .font(.system(size: 16, weight: .black, design: .serif))
                            
                        }
                        Spacer()
                        HStack{
                            Image(systemName: "location.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .symbolRenderingMode(.hierarchical)
                                    .foregroundColor(.appOrange)
                            Text("UTS Building 11")
                                .foregroundColor(.appOrange)
                                .bold()
                                .font(.system(size: 18, design: .rounded))
                                .frame(maxWidth: 300, maxHeight: 35)
                                .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                                .cornerRadius(50)
                                .opacity(0.7)
                        }
                        
                        
                        HStack{
                            Image(systemName: "person.text.rectangle.fill")
                                .resizable()
                                .frame(width: 28, height: 22)
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.appOrange)
                            Button(action: {
                                showingOfferView = true
                            }) {
                                Text("Promo Passport")
                                    .foregroundColor(.appOrange)
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: 300, maxHeight:30)
                                    .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                                    .opacity(0.7)
                                    .cornerRadius(50)
                                    .offset(x: 3, y: 0)
                                
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .padding()
                    .padding(.bottom, -20)
                    
                    // Order Again Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Order Again")
                            .font(.custom(
                                "ArialRoundedMTBold",
                                fixedSize: 20))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(orderbefore) { order in
                                    VStack {
                                        Image(order.iconName)
                                            
                                            .resizable()
                                                                        .scaledToFit().frame(width: 100, height: 100)
                                            .foregroundColor(.gray)
                                        Text(order.foodName)
                                        Text("Price: \(order.orderAgaiPrice)$")
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, -20)

                    // Recommendations Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recommendations")
                            .font(.custom(
                                "ArialRoundedMTBold",
                                fixedSize: 20))
                        ForEach(recommendations) { order in
                            HStack {
                                Image(order.iconName)
                                    
                                    .resizable()
                                    .scaledToFit().frame(width: 100, height: 100)
                                    .cornerRadius(7)
                                VStack(alignment: .leading) {
                                    Text(order.foodName)
//                                        Text("food")
                                }
                                .frame(width: 160, height: 30 )
                                Text("\(order.orderAgaiPrice)$")
                                    .frame(width: 50, height: 30 )
                            }
                        }
                    }
                    .padding()
                }
                .fullScreenCover(isPresented: $showingOfferView) {
                                OfferView()  // Present OfferView as a full-screen cover
                }
            }
            .padding(6)
        }


    }



#Preview {
    HomeView()
        .environmentObject(System())
}
