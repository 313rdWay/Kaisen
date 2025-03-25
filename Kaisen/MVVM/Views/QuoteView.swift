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
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 1186, height: 218)
            .shadow(radius: 10, y: 5)
            .overlay {
                HStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 155, height: 155)
                        .padding(.leading)
                    
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
}
