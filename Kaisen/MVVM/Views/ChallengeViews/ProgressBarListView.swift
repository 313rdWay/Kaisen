//
//  ProgressBarListView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import SwiftUI

struct ProgressBarListView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ProgressBarListView()
        .environmentObject(ColorManager())
}
