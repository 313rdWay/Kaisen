//
//  QuoteView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/24/25.
//

import SwiftUI

struct QuoteView: View {
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
                    
                    Text("Those Who Do Not Understand True Pain Can Never Understand True Peace.")
                        .font(.custom("Minecraft", size: 48))
//                        .padding(.trailing, 100)
                    
                    Button {
                        
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
    QuoteView()
}
