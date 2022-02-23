//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var Num: Double = 50
    @State var toggle = false
    
    var body: some View {
        VStack(){
            HStack() {
                VStack(){
                    Text("High Score")
                        .font(.system(size: 20, weight:Font.Weight.bold))
                    Text("0")
                        .font(.system(size: 25))
                }
                .padding(.leading, 30)
                
                Spacer()
                
                VStack(){
                    Text("Current Level")
                        .font(.system(size: 20, weight:Font.Weight.bold))
                    Text("1")
                        .font(.system(size: 25))
                }
                .padding(.trailing, 30)
            }
            .padding(.top, 100)
            
            Spacer()
            
            Text("Move the slider to:").font(.system(size: 30))
            Text(String(Int(Num))).font(.system(size: 30))
                
            
            Slider(value: $Num, in: 0...100)
                .padding(30)
                .accentColor(.green)
            Button("Check?") {
                }
                    .font(.system(size: 20, weight: Font.Weight.bold))
                    .padding(20)
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(Color.white)
                    .padding(10)
//                    .border(Color.purple, width: 5)
//                    .cornerRadius(40)
            
            
            
            Spacer()
            
            Text("Exact Mode?")
                .font(.system(size: 20, weight:Font.Weight.bold))
            Toggle("Exact Mode?", isOn: $toggle).labelsHidden()
                .padding(.bottom, 100)
                
            
        }
        .font(.system(.title, design: .rounded))
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
