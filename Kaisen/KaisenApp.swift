//
//  KaisenApp.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/23/25.
//

import SwiftUI

@main
struct KaisenApp: App {
    
    @StateObject var colorManager = ColorManager()
    @StateObject var challengesVM = ChallengesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(colorManager)
                .environmentObject(challengesVM)
            
        }
    }
}
