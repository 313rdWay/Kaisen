//
//  MissionView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/23/25.
//

import SwiftUI

struct MissionView: View {
    
    @EnvironmentObject var colorManager: ColorManager

    
    var body: some View {
        WindowView()
    }
}

#Preview {
    MissionView()
        .environmentObject(ColorManager())
}
