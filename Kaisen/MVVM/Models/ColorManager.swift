//
//  ColorManager.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/26/25.
//

import SwiftUI

class ColorManager: ObservableObject {
    @Published var primaryBackgroundColor: LinearGradient = LinearGradient(colors: [.lightPurple, .darkpurple], startPoint: .top, endPoint: .bottom)
    @Published var secondaryColor: LinearGradient = LinearGradient(colors: [.lightyellow, .darkYellow], startPoint: .top, endPoint: .bottom)
    @Published var tertiaryColor: Color = Color.box
}
 
