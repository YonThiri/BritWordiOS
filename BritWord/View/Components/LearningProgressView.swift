//
//  ProgressView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct LearningProgressView: View {
    
    // MARK: - PROPERTIES
    var color : Color
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            // MARK: - CLOSE BUTTON
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(color)
                    .imageScale(.large)
                    .fontWeight(.bold)
            })
            .buttonStyle(tapBounceButtonStyle())
            
            // MARK: - PROGRESS VIEW
            ProgressView(value: 0.5, total: 1)
                .progressViewStyle(CustomProgressViewStyle(progressColor: color))
            
            // MARK: - PROGRESS TEXT
            Text("1/20")
                .font(title1)
                .foregroundStyle(color)
        }
    }
}

#Preview {
    LearningProgressView(color: phoneticsColor)
}
