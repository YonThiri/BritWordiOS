//
//  BorderButtonView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct BorderButtonView: View {
    // MARK: - PROPERTIES
    var color : Color
    var buttonTitle : String
    
    var body: some View {
        Text(buttonTitle)
            .font(descriptionText)
            .foregroundStyle(color)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            .background(
                Capsule()
                    //.stroke(lineWidth: 0.5, style: .red)
                    .stroke(color, style: StrokeStyle())
                    
            )
    }
}

#Preview {
    BorderButtonView(color: phoneticsColor, buttonTitle: "Beginner")
}
