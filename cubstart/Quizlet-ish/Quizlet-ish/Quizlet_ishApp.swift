//
//  Quizlet_ishApp.swift
//  Quizlet-ish
//
//  Created by Michelle Gantos on 4/11/22.
//

import SwiftUI
import Firebase

@main
struct Quizlet_ishApp: App {
    
    init() {
        FirebaseApp.configure()
        AuthenticationService.signIn()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
