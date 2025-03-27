//
//  ChallengeListView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct ChallengeListCard: View {
    
    @EnvironmentObject var colorManager: ColorManager
    
    var body: some View {
        ZStack {
//            WindowView()
            VStack {
                HStack {
                    Text("Challenges")
                        .font(.custom("Minecraft", size: 150))
                        .foregroundStyle(.white)
                        .shadow(radius: 4, y: 2)
//                        .padding(.bottom)
                
                    //                Spacer()
                
                    Button {
                    
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.white)
                        //                    .offset(x: 1166, y: 101)
                    }
                    .offset(x: 150)
                }
                ScrollView {
                    LazyVStack {
                        ChallengeCardView()
                        
                            .padding()
                        
                        ChallengeCardView()
                        
                            .padding()
                        
                        ChallengeCardView()
                    }
                }
            }
        }
    }
}

#Preview {
    ChallengeListCard()
        .environmentObject(ColorManager())
}
