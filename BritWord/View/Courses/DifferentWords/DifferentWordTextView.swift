//
//  DifferentWordTextView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/01/2024.
//

import SwiftUI

struct DifferentWordTextView: View {
    
    // MARK: - PROPERTIES
    var meaning : String
    var iconName : String
    
    var body: some View {
        
        HStack {
            
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text(meaning)
                .font(subTitle)
                .foregroundStyle(differentColor)
            
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(differentTextBgColor)
        )
    }
}

#Preview {
    DifferentWordTextView(meaning: "american", iconName: "Chips")
}
