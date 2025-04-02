//
//  ContentView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
        .environmentObject(ColorManager())
    
}
