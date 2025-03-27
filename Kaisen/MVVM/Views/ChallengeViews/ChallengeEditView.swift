//
//  ChallengeEditView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct ChallengeEditView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    
    var body: some View {
        ZStack {
            
            WindowView()
            
            ChallengeEditCard()
                .frame(width: 1298, height: 724.5)
                .offset(/*x: -17,*/ y: -99.5)
            
        }
    }
}

#Preview {
    ChallengeEditView()
        .environmentObject(ColorManager())
}
