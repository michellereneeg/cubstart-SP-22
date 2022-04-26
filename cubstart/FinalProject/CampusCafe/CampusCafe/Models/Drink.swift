//
//  Drink.swift
//  CampusCafe
//
//  Created by Michelle Gantos on 4/23/22.
//

import Foundation


struct Drink: Identifiable, Equatable {
    let name: String
    let imageName: String
    let price: String
    
    //Identifiable
    var id: String {
        name + price
    }
    
    //Equatable
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        lhs.id == rhs.id
    }
    
}
