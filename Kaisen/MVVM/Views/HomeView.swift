//
//  HomeView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/23/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingPopUp = false
    @State private var randomQuote = ""
    @State private var navigateToTimer = false
    @State private var navigateToMissions = false
    @State private var navigateToChallenges = false
    @State private var navigateToTicTacGame = false
    
    @EnvironmentObject var colorManager: ColorManager

    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("HomeScreen")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack {
                    Button {
                        navigateToTimer = true
                    } label: {
                        Image("timerIcon")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    .offset(x: 500, y: -350)
                    
                    .navigationDestination(isPresented: $navigateToTimer) {
                        TimerViewMainMenu()
                            .navigationBarBackButtonHidden()
                    }
                    
                    Button {
                        navigateToMissions = true
                    } label: {
                        Image("hornIcon")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    .offset(x: 500, y: -350)
                    
                    .navigationDestination(isPresented: $navigateToMissions) {
                        MissionView()
//                            .navigationBarBackButtonHidden()
                    }
                    
                    Button {
                        navigateToChallenges = true
                    } label: {
                        Image("catIcon")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    .offset(y: -350)
                    
                    .navigationDestination(isPresented: $navigateToChallenges) {
                        ChallengesListView()
//                            .navigationBarBackButtonHidden()
                    }
                    
                }
                
                
                
                if showingPopUp {
                    QuoteView(quote: randomQuote, showingPopUp: $showingPopUp)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .transition(.scale)
                        .offset(y: 150)
                }
            }
            .onAppear {
                scheduleRandomPopup()
            }
        }
    }
    func scheduleRandomPopup() {
        let randomTime = Double.random(in: 1 * 60...2 * 60) // Random time between 2 - 10 minutes
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime) {
            if !showingPopUp { // Only show if not already showing
                randomQuote = quotes.randomElement() ?? "Stay positive!"
                showingPopUp = true
                
                // Hide pop-up after a few seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                    showingPopUp = false
                    scheduleRandomPopup() // Schedule the next random pop-up
                }
            } else {
                scheduleRandomPopup() // Reschedule if already showing
            }
        }
    }
}
    
#Preview {
    HomeView()
        .environmentObject(ColorManager())
}
