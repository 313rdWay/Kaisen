//
//  HomeView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/23/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingPopUp = true
    @State private var randomQuote = ""
    @State private var navigateToTimer = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("HomeScreen")
                    .resizable()
                    .ignoresSafeArea()
                
                Button {
                    navigateToTimer = true
                } label: {
                    Image("timerIcon")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                .offset(x: 500, y: -350)

                .navigationDestination(isPresented: $navigateToTimer) {
                    TimerView()
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
        let randomTime = Double.random(in: 5...20) // Random time between 5-20 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime) {
            if !showingPopUp { // Only show if not already showing
                randomQuote = quotes.randomElement() ?? "Stay positive!"
                showingPopUp = true
                
                // Hide pop-up after a few seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
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
}
