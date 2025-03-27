//
//  PomodoroTimerView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct PomodoroTimerView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    
    var body: some View {
        ZStack {
            WindowView()
            VStack {
                Text("Pomodoro Timer")
                    .font(.custom("Minecraft", size: 150))
                    .foregroundColor(.white)
                    .padding()
                        
                Text("03: 34: 298")
                    .font(.custom("Minecraft", size: 225))
                    .foregroundColor(.white)
                    .padding()
                        
                Text("Work Time")
                    .font(.custom("Minecraft", size: 50))
                    .foregroundColor(.white)
                    .padding()
                                
                Button {
                    
                } label: {
                    Capsule()
                        .fill(colorManager.secondaryColor)
                        .frame(width: 400, height: 150)
                        .overlay(
                            Text("Start")
                                .foregroundStyle(.white)
                                .font(.custom("Minecraft", size: 100))
                        )
                }

                    }
            .offset(y: -105)
                }
            }
    
    
}

#Preview {
    PomodoroTimerView()
        .environmentObject(ColorManager())
}
