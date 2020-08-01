//
//  ContentView.swift
//  swift UI
//
//  Created by Muniraja Velumani on 29/07/20.
//  Copyright © 2020 Muniraja Velumani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stopWatchManager = Stopwatch()
    
    var body: some View {
//        Text("Hello, World!")
        VStack {
            Text(String(format: "%.1f", stopWatchManager.seconds))
                .font(.custom("Avenir", size: 80))
                .fontWeight(.semibold)
                .padding(.top, 50)
                .padding(.bottom, 50)
            if stopWatchManager.mode == .stopped {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "Start", buttonColor: .green)
                }
            }
            if stopWatchManager.mode == .running {
                Button(action: {self.stopWatchManager.pause()}) {
                    TimerButton(label: "Pause", buttonColor: .blue)
                }
                Button(action: {self.stopWatchManager.stop()}) {
                    TimerButton(label: "Stop", buttonColor: .red)
                }
                .padding(.top, 30)
            }
            if stopWatchManager.mode == .paused {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "Start", buttonColor: .blue)
                }
                Button(action: {self.stopWatchManager.stop()}) {
                    TimerButton(label: "Stop", buttonColor: .red)
                }
                    .padding(.top, 30)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            .font(.custom("Avenir", size: 25))
            .foregroundColor(.white)
            .frame(width: 150, height: 150, alignment: .center)
            .background(buttonColor)
            .clipShape(Circle())
            .padding(3)
            .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(buttonColor, lineWidth: 2))
    }
}
