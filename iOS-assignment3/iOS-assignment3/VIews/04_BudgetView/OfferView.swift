//
//  OfferView.swift
//  iOS-assignment3
//
//  Created by YUN on 4/5/2024.
//

import SwiftUI

struct OfferView: View {
    
    var promoOffers = ["Free 6PC Wings", "40% OFF", "7 OFF", "Free Medium Pizza"]
    @State private var selectedPage = 0
    @State private var showingVerifyView = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundStyle(.white)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()  // Dismiss the view
                    }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                            .padding()
                    }
                                    
                    Text("Your Promo Passport!")
                    //.font(.title)
                        
                        .bold()
                        .font(.custom(
                            "ArialRoundedMTBold",
                            fixedSize: 24))
                        .padding(.bottom, -40)
                        .padding(.top, 20)
                                }

                
                
                TabView{
                    ForEach(0..<1) { index in // Assuming there are 5 promo items
                        studentCard (index: index)
                    }
                    Button(action: {
                        showingVerifyView = true
                    }) {
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                            Text("Add New ID")
                        }
                        .frame(width: 300, height: 190)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .tag(promoOffers.count)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 280) // Adjust the height according to your needs
                
                Spacer()
                
                
                Text("Exclusive Eats")
                    .padding()
                    .font(.custom(
                        "ArialRoundedMTBold",
                        fixedSize: 24))
                    .padding(.top, -15)
                PromotionList()
                    
                    .padding(.bottom, 20)
                    .padding(.top, -10)
                
            }
        }
        .sheet(isPresented: $showingVerifyView) {
                    VerifyView()  // Present VerifyView as a sheet
                }
    }
    
    struct studentCard: View{
        var index: Int
        
        var body: some View {
            VStack {
                Image("studentCard1")
                    .resizable()
                    .frame(width: 300, height: 190)
            }
            .padding(8)
            .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
    
    struct PromotionList: View {
        let promotions = Promotion.sampleData
        @State private var selectedPromotion: Promotion?
        
        var body: some View {
            NavigationView{
                List(promotions) { promotion in
                    Button(action: {
                        self.selectedPromotion = promotion
                    }) {
                        PromotionRow(promotion: promotion)
                        
                    }
                    .listRowSeparator(.hidden)
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .listStyle(.inset)
                .sheet(item: $selectedPromotion) { promotion in
                    PromotionDetail(promotion: promotion)
                }
            }
            .navigationTitle("")
            
           
        }
        
    }
    
    
    struct PromotionRow: View {
        var promotion: Promotion
        
        var body: some View {
            
            HStack {
                Image(promotion.iconName) // Placeholder for icon
//                    .frame(width: 50, height: 50)
//                    .background(Color.gray.opacity(0.5))
//                    .cornerRadius(10)
                    .resizable()  // Make the image resizable
                    .scaledToFit()  // Maintain the aspect ratio while fitting within the view
                    .frame(width: 70, height: 70)  // Set the frame size
                    .background(.clear)
                    .padding(.bottom, -10)
                    .padding(.horizontal, 4)
                VStack(alignment: .leading) {
                    Text(promotion.title)
                        .font(.headline)
                    Text("EXP  \(promotion.expirationDate)")
                        .font(.subheadline)
                }
                
            }
            .padding(12)
        }
    }
    
    
    struct PromotionDetail: View {
        var promotion: Promotion
        
        var body: some View {
            VStack {
                Spacer()
                Image(promotion.iconName)
                    .resizable()  // Make the image resizable
                    .scaledToFit()  // Maintain the aspect ratio while fitting within the view
                    .frame(width: 100, height: 100)  // Set the frame size
                    .padding(.top, -20)
                    
                Text(promotion.title)
                    .font(.largeTitle)
                Text("Expires on \(promotion.expirationDate)")
                    .font(.title)
                Spacer()
            }
            .padding()
            .frame(width: 300, height: 500) // Adjust size as needed
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 6)
        }
    }
    
    
        
    }


#Preview {
    OfferView()
}
