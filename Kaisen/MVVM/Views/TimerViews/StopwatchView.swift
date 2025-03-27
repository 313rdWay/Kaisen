//
//  StopwatchView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct StopwatchView: View {
    
    @EnvironmentObject var colorManager: ColorManager

    var body: some View {
        ZStack {
            WindowView()
            
            StopwatchCard()
        }
    }
}

#Preview {
    StopwatchView()
        .environmentObject(ColorManager())
}
