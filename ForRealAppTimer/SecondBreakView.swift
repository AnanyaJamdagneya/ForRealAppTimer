//
//  SecondBreakView.swift
//  ForRealAppTimer
//
//  Created by Scholar on 6/11/24.
//ghkn

//import SwiftUI
//
//struct SecondBreakView: View {
//    @State private var duration = "---"
//    private let desiredDuration = Calendar.current.date(byAdding: .minute, value: 5, to: Date())!
//    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    static var duratioinFormatter: DateComponentsFormatter = {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.hour, .minute, .second]
//        formatter.unitsStyle = .abbreviated
//        formatter.zeroFormattingBehavior = .dropLeading
//        return formatter
//    }()
//    
//    var body: some View {
//        ZStack{
//            Color(red: 107/255, green: 144/255, blue: 128/255)
//                .ignoresSafeArea()
//            VStack {
//                Text("YAY YOUR ON")
//                    .font(.largeTitle)
//                Text("YOUR BREAK!🥳")
//                    .font(.largeTitle)
//                Spacer()
//                    .frame(height: 50.0)
//                
//                HStack(spacing: 12) {
//                    Spacer()
//                    Text(duration)
//                        .font(.system(size: 18, weight: .bold))
//                        .padding()
//                        .foregroundStyle(Color.black)
//                        .background(Color.green)
//                        .opacity(0.3)
//                        .cornerRadius(15)
//                    Spacer()
//                }
//                
//                .frame(width: 300, height: 34)
//                .onReceive(timer) { _ in
//                    var delta = desiredDuration.timeIntervalSince(Date())
//                    if delta <= 0 {
//                        delta = 0
//                        timer.upstream.connect().cancel()
//                    }
//                    duration = SecondBreakView.duratioinFormatter.string(from: delta) ?? "---"
//                }
//                Spacer()
//                    .frame(height: 80.0)
//                Text("While you are on your break you can play any of our games by clicking here!!")
//                    .padding()
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color(red: 0.874, green: 0.617, blue: 0.622))
//            }
//            .background(Rectangle()
//                .foregroundColor(.white))
//            .cornerRadius(15)
//            .padding(.all, 32.0)
//        }
//    
//    }
//    
//}
//
//#Preview {
//    ContentView()
//}
//import SwiftUI
//
//struct SecondBreakView: View {
//    @State private var duration = "---"
//    @State private var isTimerPaused = false // Track whether the timer is paused
//    private let desiredDuration = Calendar.current.date(byAdding: .minute, value: 5, to: Date())!
//    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    static var durationFormatter: DateComponentsFormatter = {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.hour, .minute, .second]
//        formatter.unitsStyle = .abbreviated
//        formatter.zeroFormattingBehavior = .dropLeading
//        return formatter
//    }()
//    
//    var body: some View {
//        ZStack{
//            Color(red: 107/255, green: 144/255, blue: 128/255)
//                .ignoresSafeArea()
//            VStack {
//                Text("YAY YOUR ON")
//                    .font(.largeTitle)
//                Text("YOUR BREAK!🥳")
//                    .font(.largeTitle)
//                Spacer()
//                    .frame(height: 50.0)
//                
//                HStack(spacing: 12) {
//                    Spacer()
//                    Text(duration)
//                        .font(.system(size: 18, weight: .bold))
//                        .padding()
//                        .foregroundStyle(Color.black)
//                        .background(Color.green)
//                        .opacity(0.3)
//                        .cornerRadius(15)
//                    Spacer()
//                }
//                .frame(width: 300, height: 34)
//                .onReceive(timer) { _ in
//                    if !isTimerPaused {
//                        var delta = desiredDuration.timeIntervalSince(Date())
//                        if delta <= 0 {
//                            delta = 0
//                            timer.upstream.connect().cancel()
//                        }
//                        duration = SecondBreakView.durationFormatter.string(from: delta) ?? "---"
//                    }
//                }
//                
//                Spacer()
//                    .frame(height: 80.0)
//                
//                Button(action: {
//                    isTimerPaused.toggle()
//                    if isTimerPaused {
//                        timer.upstream.connect().cancel() // Pause the timer
//                    } else {
//                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Resume the timer
//                    }
//                }) {
//                    Text(isTimerPaused ? "Resume" : "Pause") // Toggle the button title
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
//                Text("While you are on your break you can play any of our games by clicking here!!")
//                    .padding()
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color(red: 0.874, green: 0.617, blue: 0.622))
//            }
//            .background(Rectangle()
//                .foregroundColor(.white))
//            .cornerRadius(15)
//            .padding(.all, 32.0)
//        }
//    }
//}
//
//struct SecondBreakView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondBreakView()
//    }
//}
import SwiftUI

struct SecondBreakView: View {
    @State private var duration = "---"
    @State private var isTimerPaused = false // Track whether the timer is paused
    private let desiredDuration = Calendar.current.date(byAdding: .minute, value: 5, to: Date())!
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var pausedTime: Date?
    @State private var remainingTime: TimeInterval = 0

    static var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropLeading
        return formatter
    }()

    var body: some View {
        ZStack{
            Color(red: 107/255, green: 144/255, blue: 128/255)
                .ignoresSafeArea()
            VStack {
                Text("YAY YOUR ON")
                    .font(.largeTitle)
                Text("YOUR BREAK!🥳")
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 50.0)
                
                HStack(spacing: 12) {
                    Spacer()
                    Text(duration)
                        .font(.system(size: 18, weight: .bold))
                        .padding()
                        .foregroundStyle(Color.black)
                        .background(Color.green)
                        .opacity(0.3)
                        .cornerRadius(15)
                    Spacer()
                }
                .frame(width: 300, height: 34)
                .onReceive(timer) { _ in
                    updateTimer()
                }
                
                Spacer()
                    .frame(height: 80.0)
                
                Button(action: {
                    toggleTimer()
                }) {
                    Text(isTimerPaused ? "Resume" : "Pause") // Toggle the button title
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.green)
                        .opacity(0.3)
                        .cornerRadius(15)
                }
                
                Text("While you are on your break you can play any of our games by clicking here!!")
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.874, green: 0.617, blue: 0.622))
            }
            .background(Rectangle()
                .foregroundColor(.white))
            .cornerRadius(15)
            .padding(.all, 32.0)
        }
    }

    private func toggleTimer() {
        if isTimerPaused {
            startTimer()
        } else {
            pauseTimer()
        }
        isTimerPaused.toggle()
    }

    private func startTimer() {
        if pausedTime != nil {
            let timeInterval = Date().timeIntervalSince(pausedTime!)
            remainingTime -= timeInterval
            pausedTime = nil
        }
    }

    private func pauseTimer() {
        pausedTime = Date()
    }

    private func updateTimer() {
        if !isTimerPaused {
            var delta = desiredDuration.timeIntervalSince(Date()) - remainingTime
            if delta <= 0 {
                delta = 0
                timer.upstream.connect().cancel()
            }
            duration = SecondBreakView.durationFormatter.string(from: delta) ?? "---"
        }
    }
}

struct SecondBreakView_Previews: PreviewProvider {
    static var previews: some View {
        SecondBreakView()
    }
}
