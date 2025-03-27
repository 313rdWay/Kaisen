//
//  TimerViewMainMenu.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/26/25.
//

import SwiftUI

struct TimerViewMainMenu: View {
    
    @State private var navigateBackHome = false
    @State private var navigateToPomoTimer = false
    @EnvironmentObject var colorManager: ColorManager


    
    var body: some View {
        NavigationStack {
            ZStack {
                
                WindowView()
                
                VStack {
                    Text("Timers")
                        .font(.custom("Minecraft", size: 100))
                        .foregroundColor(.white)
                        .padding()
                        .offset(y: 50)
                    
                    
                    Button {
                        navigateBackHome = true
                    } label: {
                        Image(systemName: "arrow.backward.square.fill")
                            .font(.system(size: 76))
                            .foregroundStyle(colorManager.secondaryColor)
                    }
                    .navigationDestination(isPresented: $navigateBackHome) {
                        HomeView()
                            .navigationBarBackButtonHidden()
                    }
                    .offset(x: -600, y: -100)

                    
                    HStack(spacing: 20) {
                        Button {
                            navigateToPomoTimer = true
                        } label: {
                            Rectangle()
                            .fill(colorManager.secondaryColor)
                            .frame(width: 500, height: 500)
                            .cornerRadius(10)
                            .shadow(radius: 10, y: 5)
                            .overlay(TimerButton(title: "Pomodoro Timer"))
                            .padding(.trailing, 100)
                        }
                        .navigationDestination(isPresented: $navigateToPomoTimer) {
                            PomodoroTimerView()
                        }

                        Button {
                            
                        } label: {
                            Rectangle()
                            .fill(colorManager.secondaryColor)
                            .frame(width: 500, height: 500)
                            .cornerRadius(10)
                            .shadow(radius: 10, y: 5)
                            .overlay(TimerButton(title: "Stopwatch Timer"))
                        }
                    }
                    .padding(.bottom, 260)
                }
            }
        }
    }
}

struct TimerButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.custom("Minecraft", size: 90))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
    }
}

#Preview {
    TimerViewMainMenu()
        .environmentObject(ColorManager())
}
