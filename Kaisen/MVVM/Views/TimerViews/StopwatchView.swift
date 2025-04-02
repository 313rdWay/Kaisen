//
//  StopwatchView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct StopwatchView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    @StateObject private var stopwatchVM = StopwatchViewModel()
    @State private var navigateToTimerMenu = false

    var body: some View {
            NavigationStack {
                ZStack {
                    WindowView()
                    
                    //                Rectangle()
                    //                    .fill(colorManager.primaryBackgroundColor)
                    //                    .ignoresSafeArea()
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
                            .offset(x: -50)
                            
                            Text("Stopwatch Timer")
                                .font(.custom("Minecraft", size: 125))
                                .foregroundColor(.white)
                                .shadow(radius: 4, y: 2)
                                .padding(.top,40)
                                .padding()
                        }
                        ScrollView {
                        Text(stopwatchVM.formattedTime(stopwatchVM.elapsedTime))
                            .font(.custom("Minecraft", size: 225))
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 2)
                        
                        Group {
                            HStack {
                                Spacer()
                                
                                Button {
                                    stopwatchVM.startStopwatch()
                                } label: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(colorManager.tertiaryColor)
                                        .frame(width: 386, height: 106)
                                        .shadow(radius: 10, y: 5)
                                        .overlay(
                                            Text(stopwatchVM.isRunning ? "Stop" : "Start")
                                                .font(.custom("Minecraft", size: 100))
                                                .foregroundStyle(.white)
                                        )
                                }
                                
                                Spacer()
                                
                                if stopwatchVM.isRunning {
                                    Button {
                                        stopwatchVM.recordLap()
                                    } label: {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(colorManager.tertiaryColor)
                                            .frame(width: 386, height: 106)
                                            .shadow(radius: 10, y: 5)
                                            .overlay(
                                                //                                    Text("Lap")
                                                Text("Lap")
                                                    .font(.custom("Minecraft", size: 100))
                                                    .foregroundStyle(.white)
                                            )
                                    }
                                } else if !stopwatchVM.isRunning {
                                    Button {
                                        stopwatchVM.resetStopwatch()
                                    } label: {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(colorManager.tertiaryColor)
                                            .frame(width: 386, height: 106)
                                            .shadow(radius: 10, y: 5)
                                            .overlay(
                                                //                                    Text("Lap")
                                                Text("Reset")
                                                    .font(.custom("Minecraft", size: 100))
                                                    .foregroundStyle(.white)
                                            )
                                    }
                                    
                                }
                                Spacer()
                            }
                        }
                        .font(.custom("Minecraft", size: 100))
                        .foregroundColor(.white)
                        
                        List(stopwatchVM.lapTimes, id: \.self) { lap in
                            Text("Lap: \(stopwatchVM.formattedTime(lap))")
                                .font(.custom("Minecraft", size: 60))
                                .foregroundStyle(.white)
                                .listRowBackground(Color.clear)
                        }
                        .frame(height: 125)
                        .scrollContentBackground(.hidden)
                        
                        Spacer()
                    }
                    .frame(width: 1298, height: 724.5)
                }
            }
        }
                

        }
    }

#Preview {
    StopwatchView()
        .environmentObject(ColorManager())
}
