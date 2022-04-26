//
//  CafeMapAppApp.swift
//  CafeMapApp
//
//  Created by Michelle Gantos on 4/17/22.
//

import SwiftUI

@main
struct CampusCafe: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
