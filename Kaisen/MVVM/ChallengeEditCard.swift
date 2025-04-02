//
//  ChallengeEditView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct ChallengeEditCard: View {
    
    @EnvironmentObject var colorManager: ColorManager
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var checkpoints: [String] = []
    @State private var resources: [String] = []
    @State private var newCheckpoint: String = ""
    @State private var newResource: String = ""
    
    var body: some View {
        VStack {
            Text("Edit Challenge")
                .font(.custom("Minecraft", size: 150))
                .foregroundStyle(.white)
                .shadow(radius: 4, y: 2)
                .padding(.top)
            Group {
                Text("Title")
                    .font(.custom("PressStart2P", size: 36))
                    .foregroundStyle(.white)
                    .shadow(radius: 4, y: 2)
                    .padding(.trailing, 1030)
                
                TextField("Challenge Title", text: $title)
                    .frame(maxWidth: 1200, maxHeight: 75) // Uniform frame
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
                        .frame(maxWidth: 523.68, maxHeight: 122)
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
                        .frame(maxWidth: 523.68, maxHeight: 122)
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
                    .frame(maxWidth: 1200, maxHeight: 151)
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
        }
    }
}

#Preview {
    ChallengeEditCard()
        .environmentObject(ColorManager())
}
