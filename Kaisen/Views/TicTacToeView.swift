//
//  TicTacToeView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/24/25.
//

import SwiftUI

struct TicTacToeView: View {
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
                            .font(.system(size: 150))
                            .offset(y:  -80)
                        
                        
                        Image("TicTacToeBoard")
                            .offset(y: -150)
                    }
                )

        }
        
    }
}

#Preview {
    TicTacToeView()
}
