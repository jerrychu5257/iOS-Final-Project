//
//  RestaurantView.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/5/1.
//

import SwiftUI

struct RestaurantView: View {
    @State var orderItemAmount: Int = 0
    
    @EnvironmentObject var system: System
    @ObservedObject var viewModel = OrderItemListViewModel()
    
    @State var selectedOrder: OrderModel = OrderModel()
    @State var selectedItem: RestaurantOrderItem = RestaurantOrderItem(image: "", name: "", price: 0.0, amount: 0)
    @State var selectedItems: [RestaurantOrderItem] = []
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    // Top Restaurant Information
                    Image(system.restaurantOrder.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .clipped()
                    VStack{
                        Text(system.restaurantOrder.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                        Text("Rating: \(String(format: "%.1f", system.restaurantOrder.rating))")
                    }
                    .padding(.vertical, 8)
                    HStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 150, height: 100)
//                                .border(Color.gray)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 16).stroke(.gray, lineWidth: 1)
                                }
                                .padding(.horizontal, 8)
                            VStack{
                                Text("$\(String(format: "%.1f", system.restaurantOrder.rating))")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Lowest Pricing")
                                    .font(.system(size: 14))
                            }
                        }
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 150, height: 100)
//                                .border(Color.gray)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 16).stroke(.gray, lineWidth: 1)
                                }
                                .padding(.horizontal, 8)
                            VStack{
                                Text("\(system.restaurantOrder.deliveryTime) min")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Delivery Time")
                                    .font(.system(size: 14))
                            }
                        }
                    }
                    Divider()
                        .padding()
                    
                    // Order Items list
                    Text("Meal")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                    
                    // list
                    ForEach(0..<5, id: \.self){ index in
                        HStack{
                            VStack{
                                Text(viewModel.orderItems[index].name)
                                    .frame(width: 150, alignment: .leading)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                Text("Price: \(String(format: "%.1f", viewModel.orderItems[index].price))$")
                                    .frame(width: 150, alignment: .leading)
                                    .font(.system(size: 16))
                                Button(action: {
                                    orderItemAmount += 1
                                    // calculate price
                                    system.orderItemsTotalPrice += viewModel.orderItems[index].price
                                    // add orderitem
                                    selectedItem.image = viewModel.orderItems[index].image
                                    selectedItem.name = viewModel.orderItems[index].name
                                    selectedItem.price = viewModel.orderItems[index].price
                                    selectedItem.amount = viewModel.orderItems[index].amount
                                    selectedItems.append(selectedItem)
                                }, label: {
                                    Text("Add 1 to Cart")
                                        .frame(width: 140, alignment: .center)
                                        .padding(4)
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                                        .cornerRadius(16)
                                })
                            }
                            .padding(.horizontal, 32)
                            Spacer()
                            Image(viewModel.orderItems[index].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .padding(.horizontal, 32)
                        }
                        Divider()
                            .padding(8)
                    }
                    // list end
                    Text("Side")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                    
                    // list
                    ForEach(0..<3){ index in
                        HStack{
                            VStack{
                                Text(viewModel.orderItems[index+5].name)
                                    .frame(width: 150, alignment: .leading)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                Text("Price: \(String(format: "%.1f", viewModel.orderItems[index+5].price))$")
                                    .frame(width: 150, alignment: .leading)
                                    .font(.system(size: 16))
                                Button(action: {
                                    orderItemAmount += 1
                                    // calculate price
                                    system.orderItemsTotalPrice += viewModel.orderItems[index+5].price
                                    // add orderitem
                                    selectedItem.image = viewModel.orderItems[index+5].image
                                    selectedItem.name = viewModel.orderItems[index+5].name
                                    selectedItem.price = viewModel.orderItems[index+5].price
                                    selectedItem.amount = viewModel.orderItems[index].amount
                                    selectedItems.append(selectedItem)
                                    
                                }, label: {
                                    Text("Add 1 to Cart")
                                        .frame(width: 140, alignment: .center)
                                        .padding(4)
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                                        .cornerRadius(16)
                                })
                            }
                            .padding(.horizontal, 32)
                            Spacer()
                            Image(viewModel.orderItems[index+5].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .padding(.horizontal, 32)
                        }
                        Divider()
                            .padding(8)
                    }
                    // list end
                    Text("Drink")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                    
                    // list
                    ForEach(0..<3){ index in
                        HStack{
                            VStack{
                                Text(viewModel.orderItems[index+8].name)
                                    .frame(width: 150, alignment: .leading)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                Text("Price: \(String(format: "%.1f", viewModel.orderItems[index+8].price))$")
                                    .frame(width: 150, alignment: .leading)
                                    .font(.system(size: 16))
                                Button(action: {
                                    orderItemAmount += 1
                                    // calculate price
                                    system.orderItemsTotalPrice += viewModel.orderItems[index+8].price
                                    // add orderitem
                                    selectedItem.image = viewModel.orderItems[index+8].image
                                    selectedItem.name = viewModel.orderItems[index+8].name
                                    selectedItem.price = viewModel.orderItems[index+8].price
                                    selectedItem.amount = viewModel.orderItems[index].amount
                                    selectedItems.append(selectedItem)
                                    
                                    
                                }, label: {
                                    Text("Add 1 to Cart")
                                        .frame(width: 140, alignment: .center)
                                        .padding(4)
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                                        .cornerRadius(16)
                                })
                            }
                            .padding(.horizontal, 32)
                            Spacer()
                            Image(viewModel.orderItems[index+8].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .padding(.horizontal, 32)
                        }
                        Divider()
                            .padding(8)
                    }
                    // list end
                    Rectangle()
                        .frame(height: 125)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            VStack{
                Spacer()
                Button(action: {
                    // badge ++
                    if(orderItemAmount != 0){
                        system.orderbadge += 1
                    }
                    // Order Items = 0
                    system.orderItemsAmount = orderItemAmount
                    orderItemAmount = 0
                    // send oder to Cart
                    selectedOrder.image = system.restaurantOrder.image
                    selectedOrder.name = system.restaurantOrder.name
                    selectedOrder.itemAmount = system.orderItemsAmount
                    system.orders.append(selectedOrder)
//                    print(system.orders)
                    // send orderItems to Cart
                    system.orderItems = selectedItems
                    selectedItems = []
                    
                    
                }, label: {
                    Text("Place Order (\(orderItemAmount))")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(width: 340, height: 80)
                        .background(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                        .cornerRadius(16)
                        .padding()
                        
                })
            }
            
        }
    }
}

#Preview {
    RestaurantView(viewModel: OrderItemListViewModel())
        .environmentObject(System())
}
