//
//  ContentView.swift
//  Shopping List 2.0
//
//  Created by Michelle Gantos on 3/29/22.
//

import SwiftUI

class Items: Identifiable {
    
    var itemName: String
    
    var quantity: String
    
    init(itemName: String, quantity: String) {
        
        self.itemName = itemName
        
        self.quantity = quantity
    }
    
}

struct ContentView: View {
    
    @State var tempItemName: String = ""
    
    @State var tempQuantity: String = ""
    
    @State var list = [
        Items(itemName: "Bananas", quantity: "3"),
        Items(itemName: "Apples", quantity: "4"),
        Items(itemName: "Eggs", quantity: "12")
    ]
    
    func AddItem() {
        list.append(Items(itemName: tempItemName, quantity: tempQuantity))
        tempItemName = ""
        tempQuantity = ""
    }
    
    func DeleteItem() {
        list.removeLast()
    }
        
    var body: some View {
        NavigationView {
            List {
                ForEach(list) {listitem in
                    CustomCell(itemName: listitem.itemName, quantity: listitem.quantity)
                }
                HStack{
                    TextField("Item Name", text: $tempItemName)
                    Spacer()
                    TextField("Quantity", text: $tempQuantity)
                    
                }
                //HStack{
                    Button("Add New Item"){
                        if tempItemName != ""  && tempQuantity != ""{
                            AddItem()
                        }
                    }
                    //Spacer()
                    
                    Button("Delete Item") {
                        DeleteItem()
                    }
                //}
               
            }.navigationTitle("Shopping List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
