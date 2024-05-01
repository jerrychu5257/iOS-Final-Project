//
//  RestaurantViewModel.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/1.
//

import Foundation

class RestaurantViewModel: ObservableObject{
    @Published var restaurants: [Restaurant] = []
    
    init(){
        restaurants = restaurantData
    }
    
    func SortByPrice(){
        restaurants = restaurants.sorted(by: { restaurant1, restaurant2 in
            return restaurant1.lowestPrice < restaurant2.lowestPrice
        })
    }
    func SortByRating(){
        restaurants = restaurants.sorted(by: { restaurant1, restaurant2 in
            return restaurant1.rating > restaurant2.rating
        })
    }
    func SortByDeliveryTime(){
        restaurants = restaurants.sorted(by: { restaurant1, restaurant2 in
            return restaurant1.deliveryTime < restaurant2.deliveryTime
        })
    }
}

let restaurantData = [
    Restaurant(image: "image_restaurant_Mac", name: "McDonald's", rating: 4.4, deliveryTime: 15, lowestPrice: 10.5),
    Restaurant(image: "image_restaurant_TacoBell", name: "Taco Bell", rating: 4.3, deliveryTime: 20, lowestPrice: 6.5),
    Restaurant(image: "image_restaurant_FiveGuys", name: "Five Guys", rating: 4.7, deliveryTime: 5, lowestPrice: 8.5),
    Restaurant(image: "image_restaurant_HungryJack", name: "Hungry Jack's", rating: 3.6, deliveryTime: 10, lowestPrice: 7),
    Restaurant(image: "image_restaurant_KFC", name: "KFC", rating: 4.2, deliveryTime: 25, lowestPrice: 9.5),
    Restaurant(image: "image_restaurant_Betty's", name: "Betty's Burgers", rating: 4.3, deliveryTime: 35, lowestPrice: 5.5),
    Restaurant(image: "image_restaurant_Oporto", name: "Oporto", rating: 4.8, deliveryTime: 15, lowestPrice: 5),
    Restaurant(image: "image_restaurant_Slim's", name: "Slim's", rating: 3.9, deliveryTime: 20, lowestPrice: 8.5),
    Restaurant(image: "image_restaurant_KebNCluck", name: "Keb N Cluck", rating: 3.4, deliveryTime: 10, lowestPrice: 7.5),
    Restaurant(image: "image_restaurant_Bowls", name: "Bowls & Burgers", rating: 4.1, deliveryTime: 40, lowestPrice: 6),
    Restaurant(image: "image_restaurant_Stacked", name: "Stacked", rating: 4.9, deliveryTime: 5, lowestPrice: 6.5),
    Restaurant(image: "image_restaurant_Schnitz", name: "Schnitz", rating: 4.2, deliveryTime: 15, lowestPrice: 9.5),
    Restaurant(image: "image_restaurant_Subway", name: "Subway", rating: 3.7, deliveryTime: 25, lowestPrice: 10),
    Restaurant(image: "image_restaurant_BurgerPoint", name: "Burger Point", rating: 3.5, deliveryTime: 20, lowestPrice: 11),
    Restaurant(image: "image_restaurant_Nando's", name: "Nando's", rating: 4.5, deliveryTime: 10, lowestPrice: 7.5),
    Restaurant(image: "image_restaurant_Grill'd", name: "Grill'd", rating: 4.7, deliveryTime: 15, lowestPrice: 10),
]
