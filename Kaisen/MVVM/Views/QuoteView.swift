//
//  QuoteView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/24/25.
//

import SwiftUI

struct QuoteView: View {
    
    @Environment(\.dismiss) var dismiss
    let quote: String
    @Binding var showingPopUp: Bool
    @EnvironmentObject var colorManager: ColorManager

    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(colorManager.secondaryColor)
            .frame(width: 1186, height: 218)
            .shadow(radius: 10, y: 5)
            .overlay {
                HStack {
                    Image("fredSmile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .mask {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.orange)
                                .frame(width: 175, height: 175)
                                .padding(.leading)
                        }
                    
                    
                    
                    Spacer()
                    
                    Text(quote)
                        .font(.custom("Minecraft", size: 48))
//                        .padding(.trailing, 100)
                    
                    Button {
                        showingPopUp.toggle()
                    } label: {
                        Image(systemName: "arrow.forward.square.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.black)
                            .padding(.top, 100)
                            .padding()
                    }

                }
            }
    }
}

#Preview {
    QuoteView(quote: "Example quote", showingPopUp: .constant(true))
        .environmentObject(ColorManager())
}
