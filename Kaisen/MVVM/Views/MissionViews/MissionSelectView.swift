//
//  MissionSelectView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/26/25.
//

import SwiftUI

struct MissionSelectView: View {
    
    @EnvironmentObject var colorManager: ColorManager

    var body: some View {
        ZStack {
            WindowView()
            
            MissionView()
                .frame(width: 1298, height: 724.5)
                .offset(/*x: -17,*/ y: -99.5)
        }
    }
}

#Preview {
    MissionSelectView()
        .environmentObject(ColorManager())
}
