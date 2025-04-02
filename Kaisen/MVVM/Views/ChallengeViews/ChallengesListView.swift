//
//  ChallengesListView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct ChallengesListView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    @EnvironmentObject var challengesVM: ChallengesViewModel
    @State private var navigateToEditView = false
    
    var body: some View {
        NavigationStack {
        ZStack {
            WindowView()
            
            //            ChallengeListCard()
            //                .frame(width: 1298, height: 724.5)
            //                .offset(/*x: -17,*/ y: -99.5)
            
            ZStack {
                VStack {
                    HStack {
                        Text("Challenges")
                            .font(.custom("Minecraft", size: 150))
                            .foregroundStyle(.white)
                            .shadow(radius: 4, y: 2)
                        
                        Button {
                            navigateToEditView = true
                        } label: {
                            Image(systemName: "plus.square.fill")
                                .font(.system(size: 80))
                                .foregroundStyle(.white)
                            //                    .offset(x: 1166, y: 101)
                        }
                        .offset(x: 150)
                        .navigationDestination(isPresented: $navigateToEditView) {
                            ChallengeEditView()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }
//                    ZStack {
                        
//                        colorManager.primaryBackgroundColor.ignoresSafeArea()
                        
                        List {
                            if challengesVM.challenges.isEmpty {
                                Text("No challenges available. Add some!")
                                    .font(.custom("Minecraft", size: 100))
                                    .foregroundStyle(.white)
                            } else {
                                ForEach(challengesVM.challenges) { challenge in
                                    ChallengeCardView(challenge: challenge)
                                        .padding(.bottom, 10)
                                        .environmentObject(challengesVM)
                                }
                                .onDelete(perform: deleteChallenge)
                            }
                        }
                        .scrollContentBackground(.hidden) // Hides default white background
                        .background(colorManager.primaryBackgroundColor) // Applies custom background
//                    }
                }
                .frame(width: 1298, height: 724.5)
                .offset(y: -100)
                
            }
        }
    }
//        .frame(width: 1298, height: 724.5)
//        .offset(y: -100)
    }
    
    private func deleteChallenge(at offsets: IndexSet) {
        challengesVM.challenges.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ChallengesListView()
        .environmentObject(ColorManager())
        .environmentObject(ChallengesViewModel())
}
