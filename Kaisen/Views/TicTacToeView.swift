//
//  TicTacToeView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/24/25.
//

import SwiftUI

struct TicTacToeView: View {
    
    @ObservedObject var TicTacToe = TicTacToeModel()
    
    var body: some View {
        ZStack {
            WindowView()
            
            Rectangle()
                .fill(.lightPurple)
                .frame(width: 1298, height: 724.5)
                .offset(/*x: -17,*/ y: -99.5)
                .overlay(
                    VStack {
                        Text("Tic Tac Toe")
                            .foregroundStyle(.white)
                            .font(.custom("Minecraft.ttf", size: 150))
//                            .font(.system(size: 150))
                            .offset(y:  -20)
                        
                        
                        ZStack {
                            Image("TicTacToeBoard")
                                .resizable()
                                .offset(y: -150)
                                .frame(width: 600, height: 600)
                            
                            let col = Array(repeating: GridItem(.flexible()), count: 3)
                            
                            LazyVGrid(columns: col, spacing: 80) {
                                ForEach(0..<9) { i in
                                    Button {
                                        TicTacToe.buttonTap(i: i)
                                    } label: {
                                        Text(TicTacToe.buttonLabel(i: i))
                                            .frame(width: 100, height: 100)
                                            .background(.clear)
                                            .foregroundStyle(.white)
                                            .font(.system(size: 45, weight: .heavy))
                                    }

                                }
                            }
                            .padding()
                            .frame(width: 600)
                            .offset(y: -150)
                        }
                        
                        Button {
                            TicTacToe.resetGame()
                        } label: {
                            Text("Restart Game")
                                .frame(width: 200, height: 50)
                                .background(.yellow)
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .heavy))
                                .clipShape(.capsule)
                        }

                    }
                )

        }
        
    }
}

#Preview {
    TicTacToeView()
}
