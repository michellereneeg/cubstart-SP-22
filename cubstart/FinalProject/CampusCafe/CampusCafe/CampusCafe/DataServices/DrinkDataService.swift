//
//  DrinkDataService.swift
//  CampusCafe
//
//  Created by Michelle Gantos on 4/23/22.
//

import Foundation

class Drinks: Identifiable{
    let name: String
    let imageName: String
    let price: String
    
    init(name: String, imageName: String, price: String){
        
        self.name = name
        self.imageName = imageName
        self.price = price
    }
}
