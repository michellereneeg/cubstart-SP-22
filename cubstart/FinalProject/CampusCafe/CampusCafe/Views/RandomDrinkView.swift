//
//  RandomDrinkView.swift
//  CampusCafe
//
//  Created by Michelle Gantos on 4/25/22.
//

import SwiftUI

struct RandomDrinkView: View {
    @State private var pickDrinkBool = false

//    @EnvironmentObject private var dm: DrinksViewModel
    

    let drinkList = [Drinks(name: "Drip Coffee", imageName: "Drip-Coffee", price: "$2.85"), Drinks(name: "Latte", imageName: "Latte",price: "$4.00"), Drinks(name: "Caramel Latte", imageName: "Caramel-Latte", price: "$4.50"), Drinks(name: "Cafe Au Lait", imageName: "Cafe-Au-Lait", price: "$4.00"), Drinks(name: "Cold Brew", imageName: "Cold-Brew", price: "$5.00"), Drinks(name: "Cold Brew", imageName: "Cold-Brew",price: "$5.00"), Drinks( name: "Mocha", imageName: "Mocha",price: "$4.50"), Drinks(name: "Americano", imageName: "Americano",price: "$3.00"), Drinks(name: "Green Tea Latte",imageName: "Green-Tea-Latte",
        price: "$4.50"), Drinks(name: "Hot Chocolate", imageName: "Hot-Chocolate", price: "$3.50") , Drinks(name: "Chai Latte",
        imageName: "Chai-Latte",price: "$4.25"), Drinks(name: "Hot Tea", imageName: "Hot-Tea", price: "$2.25"), Drinks(name: "Iced Tea", imageName: "Iced-Tea", price: "$2.50"), Drinks(name: "Espresso", imageName: "Espresso", price: "$2.50"), Drinks(name: "Cappuccino", imageName: "Cappuccino", price: "$3.95")]

    
    var body: some View {

        let randomDrink = drinkList.randomElement()
        let drinkName = randomDrink!.name
        let drinkImage = randomDrink!.imageName
        let drinkPrice = randomDrink!.price
       
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
                    
                    Button {
            //            dm.sheetDrink = drink
                        pickDrinkBool = true
        
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
                    
                    if pickDrinkBool == true{
                        Text(drinkName)
                            .font(.title)
                            .fontWeight(.bold)
                        Image(drinkImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .padding(6)
                            .background(Color.white)
                            .cornerRadius(10)
                        Text(drinkPrice)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
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
}

struct RandomDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RandomDrinkView()
            //Color("AccentColor").ignoresSafeArea()
//            Image("CoffeeBeans").ignoresSafeArea()
////            RandomDrinkView(drink: DrinkDataService.drinks.randomElement()!)
//                .padding(10)
        }
//        .environmentObject(DrinksViewModel())
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
}


