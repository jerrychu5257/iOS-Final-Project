//
//  CollectionView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/1.
//

import SwiftUI

struct CollectionView: View {
    
    @State var ListCount = 24
    
    var body: some View {
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
        }
        HStack{
            Text("Sort By:")
                .padding(10)
            Button(action: {
                SortByPrice()
            }, label: {
                Text("Price")
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.gray.opacity(0.3))
            })
            Button(action: {
                SortByRating()
            }, label: {
                Text("Rating")
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.gray.opacity(0.3))
            })
            Button(action: {
                SortByDeliveryTime()
            }, label: {
                Text("Delivery Time")
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.gray.opacity(0.3))
            })
        }
        Text("\(ListCount) Results")
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .padding(.horizontal, 32)
            .padding(.vertical, 8)
        
        // List
        HStack{
            Image("image_restaurant_Mac")
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(16)
            VStack{
                Text("Macdonald")
                    .frame(width: 120, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("Rating: ")
                    .frame(width: 120, alignment: .leading)
                Text("Delivery Time: ")
                    .frame(width: 120, alignment: .leading)
            }
            .padding(.horizontal, 8)
            Spacer()
            ZStack{
                Rectangle()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .foregroundColor(.gray.opacity(0.3))
                Text("$XX.XX")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
        }
        .padding(.horizontal, 32)
        //List End
        
        Spacer()
    }
    
    func SortByPrice(){
        
    }
    func SortByRating(){
        
    }
    func SortByDeliveryTime(){
        
    }
}

#Preview {
    CollectionView()
}
