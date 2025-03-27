//
//  ProgressMenu.swift
//  Kaisen1
//
//  Created by Breona Clawson on 3/27/25.
//

import SwiftUI

struct ProgressMenu: View {
    
    @EnvironmentObject var colorManager: ColorManager

    
    var body: some View {
        
        ZStack {
            Color.royalPurple
                .ignoresSafeArea()
                
            VStack {
                ProgessView()
                ProgessView()
                ProgessView()
            }
            
        
        }
    }
}
#Preview {
    ProgressMenu()
        .environmentObject(ColorManager())
   
}
