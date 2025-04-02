//
//  ChallengeEditView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct ChallengeEditView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    @EnvironmentObject var challengesVM: ChallengesViewModel
    @State private var navigateBackToList = false
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var checkpoints: [String] = []
    @State private var resources: [String] = []
    @State private var newCheckpoint: String = ""
    @State private var newResource: String = ""
    
    var body: some View {
        ZStack {
            
            WindowView()
            
//            ChallengeEditCard()
//                .frame(width: 1298, height: 724.5)
//                .offset(/*x: -17,*/ y: -99.5)
            
            VStack {
                HStack {
                    Button {
                        navigateBackToList = true
                    } label: {
                        Image(systemName: "arrow.backward.square.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.white)
                        //                    .offset(x: 1166, y: 101)
                    }
                    .offset(x: -75)
                    .navigationDestination(isPresented: $navigateBackToList) {
                        ChallengesListView()
                            .navigationBarBackButtonHidden()
                    }

                    
                    Text("Edit Challenge")
                        .font(.custom("Minecraft", size: 150))
                        .foregroundStyle(.white)
                        .shadow(radius: 4, y: 2)
                        .padding(.top)
                }
                Group {
                    Text("Title")
                        .font(.custom("PressStart2P", size: 36))
                        .foregroundStyle(.white)
                        .shadow(radius: 4, y: 2)
                        .padding(.trailing, 1030)
                    
                    TextField("Challenge Title", text: $title)
                        .frame(maxWidth: 1200, maxHeight: 50) // Uniform frame
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colorManager.tertiaryColor)
                            //                            .opacity(0.2)
                        )
                        .multilineTextAlignment(.leading) // Align wrapping text
                        .padding(.leading, 8)
                    
                }
                .padding(.trailing, 75)
                .padding(.bottom)
                HStack {
                    VStack {
                        Text("Description")
                            .font(.custom("PressStart2P", size: 36))
                            .foregroundStyle(.white)
                            .shadow(radius: 4, y: 2)
                            .padding(.leading)
                            .padding(.trailing, 150)
                        
                        TextField("Description", text: $description)
                            .frame(maxWidth: 523.68, maxHeight: 100)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(colorManager.tertiaryColor)
                                //                                .opacity(0.2)
                            )
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.trailing, 70)
                    
                    //                Spacer()
                    
                    VStack {
                        Text("Resources")
                            .font(.custom("PressStart2P", size: 36))
                            .foregroundStyle(.white)
                            .shadow(radius: 4, y: 2)
                            .padding(.trailing, 195)
                        
                        TextField("Challenge Resources", text: $newResource)
                            .frame(maxWidth: 523.68, maxHeight: 100)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(colorManager.tertiaryColor)
                                //                                .opacity(0.2)
                            )
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.trailing, 100)
                }
                .padding(.bottom)
                VStack {
                    Text("Checkpoints")
                        .font(.custom("PressStart2P", size: 36))
                        .foregroundStyle(.white)
                        .shadow(radius: 4, y: 2)
                        .padding(.trailing, 830)
                    
                    
                    TextField("Challenge Checkpoints", text: $newCheckpoint)
                        .frame(maxWidth: 1200, maxHeight: 100)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colorManager.tertiaryColor)
                            //                            .opacity(0.2)
                        )
                        .multilineTextAlignment(.leading)
                }
                .padding(.trailing, 40)
                .padding(.bottom)
                
                Button {
                    let checkpointList = newCheckpoint.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                    let resourceList = newResource.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                    challengesVM.addChallenges(title: title, description: description, checkpoints: checkpointList, resources: resourceList)
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(colorManager.tertiaryColor)
                        .frame(width: 386, height: 50)
                        .shadow(radius: 10, y: 5)
                        .overlay(
                            Text("Save")
                                .font(.custom("Minecraft", size: 50))
                                .foregroundStyle(.white)
                        )
                    
                }
            }
            .frame(width: 1298, height: 724.5)
            .offset(y: -100)
            
           
        }
    }
}

#Preview {
    ChallengeEditView()
        .environmentObject(ColorManager())
        .environmentObject(ChallengesViewModel())

}
