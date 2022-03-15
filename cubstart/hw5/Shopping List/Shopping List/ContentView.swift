//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items: Identifiable {
    let imageName: String
    let itemName: String
    let quantity: String
    
    init(imageName: String, itemName: String, quantity: String){
        self.imageName = imageName
        self.itemName = itemName
        self.quantity = quantity
    }
}

struct ContentView: View {
    
    var fruit = [Items(imageName: "apple", itemName: "Apples", quantity: "4 each"), Items(imageName: "banana", itemName: "Bananas", quantity: "3 each"),  Items(imageName: "eggs", itemName: "Eggs", quantity: "1 dozen")]
    
    var vegetables = [Items(imageName: "carrots", itemName: "Carrots", quantity: "1 bunch"), Items(imageName: "cauliflower", itemName: "Cauliflower", quantity: "1 head"), Items(imageName: "mushrooms", itemName: "Mushrooms", quantity: "1 box"), Items(imageName: "onions", itemName: "Onions", quantity: "3 each")]
    
    var frozen = [Items(imageName: "ice cream", itemName: "Ice Cream", quantity: "1 pint"), Items(imageName: "veggie burgers", itemName: "Veggie Burgers", quantity: "1 box")]
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Frozen Foods")){
                    ForEach(frozen) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                
                Section(header: Text("Fruits")){
                    ForEach(fruit) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                
                Section(header: Text("Vegetables")){
                    ForEach(vegetables) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
            }.navigationTitle("Shopping List")
        
        }
}
}
