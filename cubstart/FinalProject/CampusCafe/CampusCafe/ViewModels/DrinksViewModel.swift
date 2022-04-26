//
//  DrinksViewModel.swift
//  CampusCafe
//
//  Created by Michelle Gantos on 4/23/22.
//

import Foundation
import SwiftUI

class DrinksViewModel: ObservableObject {
    //All loaded drinks
    @Published var drinks: [Drink]
    
    //Show location detail via sheet
    @Published var sheetDrink: Drink? = nil
    
    init() {
        let drinks = DrinkDataService.drinks
        self.drinks = drinks
    }
    
    func randomPick() -> (String, String, String) {
        let randomDrink = drinks.randomElement()
        let drinkName = randomDrink!.name
        let drinkImage = randomDrink!.imageName
        let drinkPrice = randomDrink!.price
        return (drinkName, drinkImage, drinkPrice)
        
}
    
}
