//
//  ContentView.swift
//  ForRealAppTimer
//
//  Created by Scholar on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack{
               Color(red: 107/255, green: 144/255, blue: 128/255)
                    .ignoresSafeArea()
               
                
                VStack {
                    Text("Welcome to the timer!!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 25.0)
                    Text("Please pick an amount of time to study for! 😀")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 45.0)
                    NavigationLink(destination: SecondView()) {
                        Text("25 minutes of studying-> 5 minute break!")
                  .font(.title3)
                            .foregroundColor(Color(red: 0.874, green: 0.617, blue: 0.622))
                    }
                    Spacer()
                        .frame(height: 45.0)
                    NavigationLink(destination: ThirdView()) {
                        Text("35 minutes of studying-> 5 minute break!")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.874, green: 0.617, blue: 0.622))
                    }
//                   Spacer()
//                        .frame(width: -3.0, height: 15.0)
                    
                    NavigationLink(destination: FourthView()) {
                        Text("50 minutes of studying-> 10 minute break!")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.874, green: 0.617, blue: 0.622))
//                        Spacer()
//                            .frame(height: 15.0)
                    }
                        .padding(54.0)
                    
                }
                .background(Rectangle()
                    .foregroundColor(.white))
                .cornerRadius(15)
                .padding(.all, 25.0)
                
            }
        }
    }
}
    
    #Preview {
        ContentView()
    
}
