//
//  SearchView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/29.
//

import SwiftUI

struct SearchView: View {
    
    @State var restaurantImages =
    [
        "image_restaurant_Mac",
        "image_restaurant_KFC",
        "image_restaurant_MadMex",
        "image_restaurant_TacoBell",
        "image_restaurant_MaLaTown",
        "image_restaurant_PappaRich",
        "image_restaurant_SushiWorld"
    ]
    
    @State var restaurantNames =
    [
        "McDonald's",
        "KFC",
        "MadMex",
        "TacoBell",
        "MaLaTown",
        "PappaRich",
        "SushiWorld"
    ]
    
    @State var foodImages =
    [
        "image_food_Fast Food",
        "image_food_Sushi",
        "image_food_Healthy",
        "image_food_Chinese",
        "image_food_Indian",
        "image_food_Japanese",
        "image_food_Korean",
        "image_food_Thai",
        "image_food_Vietnamese",
        "image_food_Nepalese",
        "image_food_Indonesian",
        "image_food_Filipino",
        "image_food_Mexican",
        "image_food_Malaysian",
        "image_food_Taiwanese",
        "image_food_Italian"
    ]
    
    @State var foodNames =
    [
        "Fast Food",
        "Sushi",
        "Healthy",
        "Chinese",
        "Indian",
        "Japanese",
        "Korean",
        "Thai",
        "Vietnamese",
        "Nepalese",
        "Indonesian",
        "Filipino",
        "Mexican",
        "Malaysian",
        "Taiwanese",
        "Italian"
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("Search")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Restaurant near you")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 16)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(0..<restaurantImages.count, id: \.self) { index in
                                VStack{
                                    Image(restaurantImages[index])
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(16)
                                    Text(restaurantNames[index])
                                        .font(.system(size: 12))
                                }
                            }
                        }
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text("Food near you")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 16)
                    HStack{
                        VStack{
                            ForEach(0..<foodImages.count/2, id: \.self){ index in
                                NavigationLink(destination: CollectionView()){
                                    VStack{
                                        Image(foodImages[index])
                                            .resizable()
                                            .frame(width: 160, height: 100)
                                            .cornerRadius(16)
                                        Text(foodNames[index])
                                            .font(.system(size: 16))
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.black)
                                            .frame(width: 160, alignment: .leading)
                                    }
                                    .padding(.vertical, 6)
                                }
                                
                            }
                        }
                        VStack{
                            ForEach(0..<foodImages.count/2, id: \.self){ index in
                                NavigationLink(destination: CollectionView()){
                                    VStack{
                                        Image(foodImages[index+8])
                                            .resizable()
                                            .frame(width: 160, height: 100)
                                            .cornerRadius(16)
                                        Text(foodNames[index+8])
                                            .font(.system(size: 16))
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.black)
                                            .frame(width: 160, alignment: .leading)
                                    }
                                }
                            }
                            .padding(.vertical, 6)
                        }
                    }
                    .padding(.horizontal, 32)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    SearchView()
}
