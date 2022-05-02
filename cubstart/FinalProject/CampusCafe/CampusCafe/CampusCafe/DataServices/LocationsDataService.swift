//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        
        Location(
            name: "The Golden Bear Café",
            cityName: "Upper Sproul Plaza",
            coordinates: CLLocationCoordinate2D(latitude: 37.8698,  longitude:  -122.2596),
            description: "M-F 7:30AM-8PM, Sa, Su Closed",
            imageNames: [
                "GoldenBear3",
                "GoldenBear2",
                "GoldenBear1",
            ],
            link: "https://caldining.berkeley.edu/locations/campus-restaurants/the-golden-bear-cafe/"),
        
        Location(
            name: "Brown's California Cafe",
            cityName: "Genetics and Plant Biology Building",
            coordinates: CLLocationCoordinate2D(latitude: 37.8733, longitude: -122.2647),
            description: "Hours: M-F 7:30AM-3PM,  Sa, Su Closed",
            imageNames: [
                "Browns1",
                "Browns2",
                "Browns3",
            ],
            link: "https://caldining.berkeley.edu/locations/campus-restaurants/browns/"),
        
        Location(
            name: "Free Speech Movement Cafe",
            cityName: "3rd Floor Moffitt Library",
            coordinates: CLLocationCoordinate2D(latitude: 37.8725, longitude: -122.2608),
            description: "M-Th 7AM-7PM, F 7AM-5PM, Sa, Su Closed",
            imageNames: [
                "Free1",
                "Free2",
                "Free3",
            ],
            link: "https://www.lib.berkeley.edu/about/fsm-cafe"),
        
        Location(
            name: "Press",
            cityName: "Moffitt Library, Sather Rd",
            coordinates: CLLocationCoordinate2D(latitude: 37.8727, longitude: -122.2604),
            description: "Hours: M 7:30AM-2:30PM, Tu-F 7:30AM-4PM,  Sa, Su Closed",
            imageNames: [
                "Press1",
                "Press2",
                "Press3",
            ],
            link: "https://update.lib.berkeley.edu/2017/10/02/press-cafe/"),
        
        Location(
            name: "Terrace Cafe",
            cityName: "Bechtel Engineering Center",
            coordinates: CLLocationCoordinate2D(latitude: 37.8741, longitude: -122.2584),
            description: "M-F 7:30AM-3PM, Sa, Su Closed",
            imageNames: [
                "Terrace1",
                "Terrace2",
            ],
            link: "https://caldining.berkeley.edu/locations/campus-restaurants/terrace-cafe/"),
        
        Location(
            name: "Yali’s Qualcomm Café",
            cityName: "Sutardja Dai Hall",
            coordinates: CLLocationCoordinate2D(latitude: 37.8746, longitude:  -122.2587),
            description: "M-F 8AM-3PM,  Sa, Su Closed",
            imageNames: [
                "YalisQ1",
                "YalisQ2",
                "YalisQ3",
            ],
            link: "https://yaliscoffee.com/"),
        
        Location(
            name: "V&A Café",
            cityName: "Etcheverry Hall",
            coordinates: CLLocationCoordinate2D(latitude: 37.8753, longitude:  -122.2589),
            description: "M-F 7:15AM-7PM, Sa, Su Closed",
            imageNames: [
                "VA1",
                "VA2",
                "VA3",
            ],
            link: "https://www.vandacafeucb.com/"),
        
        Location(
            name: "Yali's Stanley Hall Café",
            cityName: "Stanley Hall",
            coordinates: CLLocationCoordinate2D(latitude: 37.8739, longitude:  -122.2564),
            description: "M-F 8AM-3PM, Sa, Su Closed",
            imageNames: [
                "YalisS1",
                "YalisS2",
                "YalisS3",
            ],
            link: "https://yaliscoffee.com/"),
        
        Location(
            name: "The Coffee Lab",
            cityName: "Hildebrand Hall",
            coordinates: CLLocationCoordinate2D(latitude: 37.8727, longitude:  -122.2558),
            description: "M-F 8AM-4:30PM, Sa, Su Closed",
            imageNames: [
                "CoffeeLab1",
                "CoffeeLab2",
                "CoffeeLab3",
            ],
            link: "https://www.yelp.com/biz/the-coffee-lab-berkeley-2"),
        
        Location(
            name: "Cafe Think",
            cityName: "Connie & Kevin Chou Hall, Haas School of Business",
            coordinates: CLLocationCoordinate2D(latitude: 37.8723,  longitude:  -122.2542),
            description: "M-Th 7:30AM-8:15PM, F 7:30AM-3PM, Sa, Su Closed",
            imageNames: [
                "CafeThink1",
                "CafeThink2",
                "CafeThink3",
            ],
            link: "https://www.cafethinkberkeley.com/"),
        
        Location(
            name: "Café Zeb",
            cityName: "2745 Bancroft Way",
            coordinates: CLLocationCoordinate2D(latitude: 37.8696,  longitude:  -122.2527),
            description: "M-Th 7:30AM-7PM, F 7:30AM-4PM, Sa, Su Closed",
            imageNames: [
                "Zeb1",
                "Zeb2",
                "Zeb3",
            ],
            link: "https://www.yelp.com/biz/cafe-zeb-berkeley"),
        
        Location(
            name: "Edmond's Cafe",
            cityName: "International House, 2299 Piedmont Ave",
            coordinates: CLLocationCoordinate2D(latitude: 37.8696,  longitude:  -122.2514),
            description: "M-Th 7:30AM-9PM,  F, Sa 7:30AM-10PM , Su 8AM-9PM",
            imageNames: [
                "IHouse1",
                "IHouse2",
                "IHouse3",
            ],
            link: "https://ihouse.berkeley.edu/dining/edmonds-caf%C3%A9"),
        
    ]
    
}
