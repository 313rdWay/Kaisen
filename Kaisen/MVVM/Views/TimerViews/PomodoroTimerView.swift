//
//  PomodoroTimerView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct PomodoroTimerView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    @State private var navigateToTimerMenu = false
    @StateObject private var pomodoroVM = PomodoroTimerViewModel()

    
    var body: some View {
        NavigationStack {
        ZStack {
            WindowView()
            VStack {
                
                HStack {
                    Button {
                        navigateToTimerMenu = true
                    } label: {
                        Image(systemName: "arrow.backward.square.fill")
                            .font(.system(size: 76))
                            .foregroundStyle(colorManager.secondaryColor)
                    }
                    .navigationDestination(isPresented: $navigateToTimerMenu) {
                        TimerViewMainMenu()
                            .navigationBarBackButtonHidden()
                    }
                    .offset(x: -60, y: -8)

                    Text("Pomodoro Timer")
                        .font(.custom("Minecraft", size: 125))
                        .foregroundColor(.white)
//                        .padding()

                }
                
//                Text("03: 34: 298")
                Text(pomodoroVM.timeFormatted())
                    .font(.custom("Minecraft", size: 225))
                    .foregroundColor(.white)
                    .padding()
                
                Text(pomodoroVM.currentPhase == .work ? "Work Time" : "Break Time")
                    .font(.custom("Minecraft", size: 50))
                    .foregroundColor(.white)
                    .padding()
                
                Button {
                    pomodoroVM.startTimer()
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
    
    
}

#Preview {
    PomodoroTimerView()
        .environmentObject(ColorManager())
}
