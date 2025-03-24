//
//  WindowView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/23/25.
//

import SwiftUI

struct WindowView: View {
    var body: some View {
        ZStack {
            HomeView()
            
            Image("WindowBorder")
                .resizable()
                .frame(width: 1320, height: 761)
                .offset(/*x: -17,*/ y: -107)
            
            Rectangle()
                .frame(width: 1298, height: 724.5)
                .offset(/*x: -17,*/ y: -99.5)
        }
    }
}

#Preview {
    WindowView()
}
