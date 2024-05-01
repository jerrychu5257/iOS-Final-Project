//
//  CollectionView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/1.
//

import SwiftUI

struct CollectionView: View {
    
    @ObservedObject var viewModel = RestaurantViewModel()
    
    var body: some View {
        ScrollView{
            ZStack{
                Rectangle()
                    .frame(height: 120)
                    .foregroundColor(.gray.opacity(0.3))
                Text("Fast Food")
                    .font(.system(size: 24))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 8)
                    .offset(CGSize(width: 0, height: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image("image_burger")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(CGSize(width: 0.0, height: 20.0))
            }
            HStack{
                Text("Sort By:")
                    .padding(10)
                Button(action: {
                    viewModel.SortByPrice()
                }, label: {
                    Text("Price")
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.gray.opacity(0.3))
                })
                Button(action: {
                    viewModel.SortByRating()
                }, label: {
                    Text("Rating")
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.gray.opacity(0.3))
                })
                Button(action: {
                    viewModel.SortByDeliveryTime()
                }, label: {
                    Text("Delivery Time")
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.gray.opacity(0.3))
                })
            }
            Text("\(viewModel.restaurants.count) Results")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .padding(.horizontal, 32)
                .padding(.vertical, 8)
            
            // List
            ForEach(viewModel.restaurants){ restaurant in
                HStack{
                    Image(restaurant.image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(16)
                    VStack{
                        Text(restaurant.name)
                            .frame(width: 140, alignment: .leading)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Text("Rating: \(String(format: "%.1f", restaurant.rating))")
                            .frame(width: 140, alignment: .leading)
                            .font(.system(size: 14))
                        Text("Delivery Time: \(restaurant.deliveryTime) min")
                            .frame(width: 140, alignment: .leading)
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal, 8)
                    Spacer()
                    ZStack{
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .cornerRadius(30)
                            .foregroundColor(.gray.opacity(0.2))
                        Text("$\(String(format: "%.1f", restaurant.lowestPrice))")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                }
                .padding(.horizontal, 32)
            }
            //List End
            
            Spacer()
        }
    }

}

#Preview {
    CollectionView(viewModel: RestaurantViewModel())
}
