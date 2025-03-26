//
//  MissionView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/23/25.
//

import SwiftUI

struct MissionView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    var missionData: [MissionDetail] = missions
    
    var body: some View {
        
       TabView {
            ForEach(missionData) {item in
                MissionCardView(missionDetail: item)
            }
        }
       .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea()
    }
}
#Preview {
    MissionView()
        .environmentObject(ColorManager())
}
