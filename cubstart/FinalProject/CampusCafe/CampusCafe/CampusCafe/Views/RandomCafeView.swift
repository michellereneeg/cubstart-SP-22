//
//  RandomCafeView.swift
//  CampusCafe
//
//  Created by Ellen Zheng on 5/1/22.
//
import SwiftUI
import Foundation

class Locations: Identifiable{
    let name: String
    let locName: String
    
    init(name: String, locName: String){
        
        self.name = name
        self.locName = locName
    }
}


struct RandomCafeView: View {
    @State private var pickCafeBool = false
    @State private var vibeLevel = 1.0

    
    var body: some View {
        
        let locList = [Locations(
            name: "The Golden Bear Café",
            locName: "Upper Sproul Plaza"),
      
        Locations(
            name: "Brown's California Cafe",
            locName: "Genetics and Plant Biology Building"),
        
        Locations(
            name: "Free Speech Movement Cafe",
            locName: "3rd Floor Moffitt Library"),
        
        Locations(
            name: "Press",
            locName: "Moffitt Library, Sather Rd"),
        
        Locations(
            name: "Terrace Cafe",
            locName: "Bechtel Engineering Center"),
        
        Locations(
            name: "Yali’s Qualcomm Café",
            locName: "Sutardja Dai Hall"),
        
        Locations(
            name: "V&A Café",
            locName: "Etcheverry Hall"),
        
        Locations(
            name: "Yali's Stanley Hall Café",
            locName: "Stanley Hall"),
        
        Locations(
            name: "The Coffee Lab",
            locName: "Hildebrand Hall"),
        
        Locations(
            name: "Cafe Think",
            locName: "Connie & Kevin Chou Hall, Haas School of Business"),
        
        Locations(
            name: "Café Zeb",
            locName: "2745 Bancroft Way"),
        
        Locations(
            name: "Edmond's Cafe",
            locName: "International House, 2299 Piedmont Ave")
        ]
        
        GeometryReader { geo in
            ZStack {
                Image("CafeBack")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack(alignment: .center, spacing: 16) {
            
                    titleSection
                    Slider(
                    value: $vibeLevel,
                    in: 0...11,
                    step: 1.0
                    ){
                        Text("Vibe Level")
                    } minimumValueLabel: {
                        Text("Chill")
                            .font(.title2)
                            .fontWeight(.bold)
                    } maximumValueLabel: {
                        Text("Hopping")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    
                    
                    let currCafe = locList[Int(vibeLevel)]
                    let currName = currCafe.name
                    let currPlace = currCafe.locName

                    Button {
                        pickCafeBool = true
                    }
                    label: {
                        Text("Pick A Cafe!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(width: 130   , height: 33)
                    }
                    .tint(.primary)
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(20)
                    .padding()
                    if pickCafeBool == true{
                        Text(currName)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text(currPlace)
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            
    
                    }
                    
                }
                
                
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y: 0)
                    .frame(maxWidth: 380)
                )
//
            }
        }
        
       
    }
   
}

struct RandomCafeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RandomCafeView()
            //Color("AccentColor").ignoresSafeArea()
//            Image("CoffeeBeans").ignoresSafeArea()
////            RandomCafeView(drink: DrinkDataService.drinks.randomElement()!)
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


extension RandomCafeView {
//    private var imageSection: some View {
//        ZStack {
//                Image("Coffee-Drinks0")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 200, height: 200)
//                    .cornerRadius(10)
//
//            }
//        .padding(6)
//        .background(Color.white)
//        .cornerRadius(10)
//    }
    
    private var titleSection: some View {
        VStack (alignment: .center) {
            Text("Which cafe should I go to?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
                
        }
        .frame(maxWidth:250, alignment: .center)
        
    }
}
