//
//  ButtonView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct ButtonView: View {
    // MARK: - PROPERTIES
    var color : Color
    var buttonTitle : String
    
    var body: some View {
        Text(buttonTitle)
            .font(descriptionText)
            .foregroundStyle(whiteColor)
            .frame(height: 50)
            .frame(minWidth: 100)
            .padding(.horizontal, 30)
            .background(
                Capsule()
                    .fill(color)
            )
    }
}

#Preview {
    ButtonView(color: vocabularyColor, buttonTitle: "Start")
}
