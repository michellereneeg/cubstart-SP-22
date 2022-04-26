//
//  DrinkPickView.swift
//  CampusCafe
//
//  Created by Michelle Gantos on 4/24/22.
//

import SwiftUI

struct DrinkPickView: View {
    @EnvironmentObject private var dm: DrinksViewModel
    
    var body: some View {
        let yourDrink = randomPick()
        VStack {
            Text("\(yourDrink.0)")
                .font(.title2)
                .fontWeight(.bold)
                
            Image("\(yourDrink.1)")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .cornerRadius(10)
                .padding()
            Text("\(yourDrink.2)")
                .font(.title3)
                .fontWeight(.semibold)
        }
        
    }
       
    
//    func randomPick() -> String {
//        let randomDrink = dm.drinks.randomElement()
//        return randomDrink?.name ?? "Try Again"
        func randomPick() -> (String, String, String) {
            let randomDrink = dm.drinks.randomElement()
            let drinkName = randomDrink!.name
            let drinkImage = randomDrink!.imageName
            let drinkPrice = randomDrink!.price
            return (drinkName, drinkImage, drinkPrice)
            
    }
}

struct DrinkPickView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkPickView()
            .environmentObject(DrinksViewModel())
    }
}
