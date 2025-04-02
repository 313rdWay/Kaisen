//
//  ChallengeCardView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct ChallengeCardView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    @EnvironmentObject var challengesVM: ChallengesViewModel

    var challenge: Challenge
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(colorManager.tertiaryColor)
            .frame(width: 1055, height: 205)
            .shadow(radius: 10, y: 5)
            .overlay(
                VStack {
                    
                    Text(challenge.title)
                        .font(.custom("PressStart2P", size: 40))
                        .shadow(radius: 4, y: 2)
                        .padding(.top, 23)
                        .padding(.trailing, 400)
                    Spacer()
                    
                    Text(challenge.description)
                        .font(.custom("PressStart2P", size: 21))
                        .shadow(radius: 4, y: 2)
                        .frame(width: 1020, height: 75)
                        .truncationMode(.tail)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    Text("Checkpoints Completed 0/\(challenge.checkpoints.count)")
                        .font(.custom("PressStart2P", size: 21))
                        .shadow(radius: 4, y: 2)
                        .padding()
                        .padding(.trailing, 450)
                }
            )
        
        
    }
}

#Preview {
    ChallengeCardView(challenge: Challenge(title: "Sample Challenge", description: "A test challenge", checkpoints: ["Step 1", "Step 2"], resources: []))
        .environmentObject(ColorManager())
        .environmentObject(ChallengesViewModel())

}
