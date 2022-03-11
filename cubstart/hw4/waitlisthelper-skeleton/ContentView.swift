//
//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    @State var seatsBefore: Int = 0
    
    var body: some View {
            //YOUR CODE HERE (NavView)//
        NavigationView {
            
                //YOUR CODE HERE (TabView)//
            TabView {
                ZStack {
                    //YOUR CODE HERE (background)//
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Group {
                            Spacer()
                            //YOUR CODE HERE (title)//
                            (Text("Will ") + Text("_you_ ").foregroundColor(.blue) + Text("get off the waitlist?"))
                                .font(.title).bold()
                                .padding(.top, 70).padding(.bottom, 1)
                            Text("😱").font(.system(size: 60))
                        }
                        
                        Spacer()
                        HStack {
                            //YOUR CODE HERE (description)//
                            Text("Place on Waitlist: ").fontWeight(.semibold) +
                            Text("\(waitlistPlace, specifier: "%.f")").foregroundColor(.blue).fontWeight(.black)
                                
                            
                            Spacer()
                        } .font(.system(size: 20))
                        //YOUR CODE HERE (slider)//
                        Slider(value: $waitlistPlace, in: 0...200, step: 1)
                       
                        HStack {
                            //YOUR CODE HERE (description)//
                            Text("Class size: ").fontWeight(.semibold) + Text( "\(classSize, specifier: "%.f")").foregroundColor(.blue).fontWeight(.black)
                                
                            
                            Spacer()
                        }.font(.system(size: 20))
                        //YOUR CODE HERE (slider)//
                        Slider(value: $classSize, in: 0...1000, step: 1)
                        
                        NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                        
                        Button("**CALCULATE**") {
                            //YOUR CODE HERE (calculate)//
                            calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                            
                            text = getFeedbackText()
                            
                            calculate = true
                        } .buttonStyle(CustomButton())
                            .padding(.bottom, 70)
                    
                        Spacer()
                        
                    } .padding()
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                //DIY VIEW GOES HERE//
                ZStack {
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                            Text("Seats before 100% :")
                                .font(.title).bold()
                                .foregroundColor(Color.black)
                                .padding()
                        Text("\(seatsBefore)").font(.system(size: 70.0)).foregroundColor(.blue).fontWeight(.black)
        
                        }

                }
                    .tabItem {
                        Image(systemName: "studentdesk")
                        Text("Seats to go")
                    }
                
            }
                    
        }
                    
                
                
            
                
        }
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        //YOUR CODE HERE//
        seatsBefore = Int((Float(waitlistPlace - classSize/10)))
        if (waitlistPlace <= classSize/10) {
            probability = 100
            seatsBefore = 0
        } else if (waitlistPlace > classSize/5) {
            probability = 0
//            seatsBefore = Int((Float(waitlistPlace - classSize/10)))
        } else {
            probability = 100 - Int((Float(waitlistPlace - classSize/10)/Float(classSize/10))*100)
//            seatsBefore = Int((Float(waitlistPlace - classSize/10)))
        }
        
//        let tenth = classSize / 10
//        if  (waitlistPlace <= tenth) {
//           probability = 100
//        } else if (waitlistPlace > tenth * 2)           {
//            probability = 0
//        } else {
//            probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth))*100))
//        }
        
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
    
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    //YOUR CODE HERE (button back)//
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left").resizable().frame(width: 25, height: 25)
                            .padding(10)
                            .background(Color.yellow)
                            .foregroundColor(Color.black)
                            .clipShape(Circle())
                            .shadow(radius: 8)
                    } .navigationBarHidden(true)
                    
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding(.top, 55)
        }
        
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //YOUR CODE HERE (button style)//
        
            .padding(20)
            .font(.system(size: 24))
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//            .scaleEffect(configuration.isPressed ? 1.2 : 1)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        // Indigo background color on release, yellow on press.
            .background(!configuration.isPressed ? Color(UIColor.systemBlue) :
                Color(UIColor.systemYellow))
                    
                    // White text color on release, black on press.
            .foregroundColor(!configuration.isPressed ? .white : .black)
             
            .cornerRadius(28)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
