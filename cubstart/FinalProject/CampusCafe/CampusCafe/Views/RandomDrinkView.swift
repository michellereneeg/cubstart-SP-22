//
//  RandomDrinkView.swift
//  CampusCafe
//
//  Created by Michelle Gantos on 4/25/22.
//

import SwiftUI

struct RandomDrinkView: View {
    @EnvironmentObject private var dm: DrinksViewModel
    let drink: Drink
    
    var body: some View {
        //let (randomName, randomImage, randomPrice) = randomPick()
        GeometryReader { geo in
            ZStack {
                Image("CoffeeBeans")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack(alignment: .center, spacing: 16) {
                    titleSection
                    imageSection
                    pickDrinkButton
                    
                }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y: 65)
                )
                .cornerRadius(10)
            }
        }
        
       
    }
    
    func randomPick() -> (String, String, String) {
        let randomDrink = dm.drinks.randomElement()
        let drinkName = randomDrink!.name
        let drinkImage = randomDrink!.imageName
        let drinkPrice = randomDrink!.price
        return (drinkName, drinkImage, drinkPrice)
        
}
}

struct RandomDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            //Color("AccentColor").ignoresSafeArea()
            Image("CoffeeBeans").ignoresSafeArea()
            RandomDrinkView(drink: DrinkDataService.drinks.randomElement()!)
                //.padding(10)
        }
        .environmentObject(DrinksViewModel())
    }
}


//
//  LocationPreviewView.swift
//  CafeMapApp
//
//  Created by Michelle Gantos on 4/19/22.
//


extension RandomDrinkView {
    private var imageSection: some View {
        ZStack {
                Image("Coffee-Drinks0")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                
            }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack (alignment: .center) {
            Text("What should I order?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
                .colorInvert()
        }
        .frame(maxWidth:330, alignment: .center)
        
    }
    
    private var pickDrinkButton: some View {
        Button {
            dm.sheetDrink = drink
        }
        label: {
            Text("Pick My Drink!")
                .font(.title3)
                .frame(width: 130   , height: 33)
        }
        .tint(.primary)
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .cornerRadius(20)
        //.buttonBorderShape(.capsule)
    }
    
}


