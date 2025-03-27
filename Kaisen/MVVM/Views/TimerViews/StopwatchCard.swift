//
//  StopwatchCard.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct StopwatchCard: View {
    
    @EnvironmentObject var colorManager: ColorManager

    var body: some View {
        ZStack {
        Image("PageOne")
        .resizable()
        .ignoresSafeArea()
            
            VStack {
                        Text("Stopwatch Timer")
                  
                            .font(.custom("Minecraft", size: 150))
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 2)
                                .padding(.top,40)
                                .padding()
                        
                        Text("03: 34: 298")
                            .font(.custom("Minecraft", size: 225))
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 2)
                         
                        Group {
                            HStack {
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(colorManager.tertiaryColor)
                                        .frame(width: 386, height: 106)
                                        .shadow(radius: 10, y: 5)
                                        .overlay(
                                            Text("Start")
                                                .font(.custom("Minecraft", size: 100))
                                                .foregroundStyle(.white)
                                        )
                                }
                                
                                Spacer()
                            
                                Button {
                                    
                                } label: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(colorManager.tertiaryColor)
                                        .frame(width: 386, height: 106)
                                        .shadow(radius: 10, y: 5)
                                        .overlay(
                                            Text("Lap")
                                                .font(.custom("Minecraft", size: 100))
                                                .foregroundStyle(.white)
                                        )
                                }
                                
                                Spacer()
                            }
                        }
                        .font(.custom("Minecraft", size: 100))
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                   
                }
            
    }
}

#Preview {
    StopwatchCard()
        .environmentObject(ColorManager())
}
