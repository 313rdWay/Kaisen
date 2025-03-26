//
//  MissionCardView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/26/25.
//

import SwiftUI

struct MissionCardView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    
    var missionDetail: MissionDetail
    
    var body: some View {
        
        ZStack {
            colorManager.primaryBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(missionDetail.title)
                    .font(.custom("Press Start 2P", size: 30))
                    .padding(.bottom, 20)
                Text(missionDetail.description)
                    .font(.custom("Press Start 2P", size: 30))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth:.infinity,maxHeight:400)
                
                    .overlay(
                        Rectangle()
                            .stroke(.black, lineWidth: 9)
                        
                    )
                    .background(.box)
            }
            .padding()
        }
        
        }
}

#Preview {
    MissionCardView(missionDetail : missions[3])
        .environmentObject(ColorManager())
}
