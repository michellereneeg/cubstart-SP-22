//
//  RandomDrinkDetailView.swift
//  CampusCafe
//
//  Created by Michelle Gantos on 4/25/22.
//

import SwiftUI

struct RandomDrinkDetailView: View {
    @EnvironmentObject private var dm: DrinksViewModel
    let drink: Drink
    
    var body: some View {
        ScrollView {
            VStack {
              imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                titleSection
                //Divider()
                descriptionSection
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topTrailing)
    }
}

struct RandomDrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkDetailView(drink: DrinkDataService.drinks.randomElement()!)
            .environmentObject(DrinksViewModel())
    }
}

//
//  LocationDetailView.swift
//  CafeMapApp
//
//  Created by Michelle Gantos on 4/20/22.
//


extension RandomDrinkDetailView {
    private var imageSection: some View {
        TabView {
                Image(drink.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(drink.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
}
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text(drink.price)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
}
    
    private var backButton: some View {
        Button {
            dm.sheetDrink = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(Color.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }

    }
}
