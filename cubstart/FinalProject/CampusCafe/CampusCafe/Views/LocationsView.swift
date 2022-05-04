//
//  LocationsView.swift
//  CafeMapApp
//
//  Created by Michelle Gantos on 4/17/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    //@EnvironmentObject private var dm: DrinksViewModel
    
    @EnvironmentObject private var vm: LocationsViewModel
    

    
    var body: some View {
        TabView {
            ZStack{
                mapLayer
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    header
                        .padding()
                    Spacer()
                    locationPreviewStack
                    
                }
            }
            .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
                LocationDetailView(location: location)
        }
            .tabItem{
                Image(systemName: "house.fill")
                Text("Campus")
            }
            
            ZStack {
                Color("AccentColor").ignoresSafeArea()
                RandomDrinkView()
                    .padding(10)
            }
//            .sheet(item: $dm.sheetDrink, onDismiss: nil) { drink in
//                RandomDrinkDetailView(drink: DrinkDataService.drinks.randomElement()!)
//            }
//            .environmentObject(DrinksViewModel())
            
           
                .tabItem{
                    Image(systemName: "cup.and.saucer.fill")
                    Text("Drink Pick")
                }
            ZStack{
                Color("AccentColor").ignoresSafeArea()
                RandomCafeView()
                    .padding(10)
                
            }
            
            .tabItem{
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                Text("Cafe Pick")
            }
        
        }
            
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name)
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.mapLocation)
                //.background(Color.blue)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                }
            }
            if vm.showLocationsList {
                LocationsListView()
            }
        
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            //Default SwiftUI pins
            //MapMarker(coordinate: location.coordinates, tint: .blue)
            //Custom pins
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
