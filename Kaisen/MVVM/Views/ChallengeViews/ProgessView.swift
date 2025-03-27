//
//  ProgessView.swift
//  Kaisen1
//
//  Created by Breona Clawson on 3/27/25.
//

import SwiftUI

struct ProgessView: View {
    
    @EnvironmentObject var colorManager: ColorManager
    @State private var progress = 0.5


        var body: some View {
            VStack {
                ProgressView(value: progress)
                    .frame(width: 700, height: 90)
                    .tint(.white)
                    .progressViewStyle(CustomProgressBar())
                Button("Progress") { progress += 0.05 }
                    .buttonStyle(.borderedProminent)
                    .font(.custom("Press Start 2P", size: 30))
                    .tint(.royalPurple)
            }
        }
    }


#Preview {
    ProgessView()
        .environmentObject(ColorManager())
}
struct CustomProgressBar: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Text("\(Int(configuration.fractionCompleted ?? 0.0 * 100))%")
            ZStack(alignment: .leading) {
                Rectangle().frame(width: 300, height: 50)
                    .opacity(0.3)
                Rectangle().frame(width: 300 * CGFloat(configuration.fractionCompleted ?? 0.0), height: 50)
                    .foregroundColor(.white)
            }
        }
    }
}
