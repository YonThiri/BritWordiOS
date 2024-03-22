//
//  ProgressView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct LearningProgressView: View {
    
    // MARK: - PROPERTIES
    var color: Color
    var progressCount: Int
    var totalQuestion: Int // Assuming totalQuestion is defined somewhere
    
    @Environment(\.dismiss) var dismiss
    @State private var progress: CGFloat = .zero // Example progress value
    
    var body: some View {
            HStack(spacing: 15) {
                // MARK: - CLOSE BUTTON
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(color)
                        .imageScale(.medium)
                        .fontWeight(.bold)
                })
                .buttonStyle(tapBounceButtonStyle())
                
                // MARK: - PROGRESS VIEW
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 10)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(color)
                            .frame(width: calculateProgressWidth(geometry: geometry), height: 10)
                            
                            
                    }
                }
                .frame(height: 10)
                
                // MARK: - PROGRESS TEXT
                Text("\(progressCount)/\(totalQuestion)")
                    .font(subTitle)
                    .foregroundStyle(color)
            }
        
    }
    
    private func calculateProgressWidth(geometry: GeometryProxy) -> CGFloat {
        let maxWidth = geometry.size.width// Adjusting for button and spacing
        let progressWidth = maxWidth * CGFloat(progressCount) / CGFloat(totalQuestion)
        return min(progressWidth, maxWidth)
    }
}


#Preview {
    LearningProgressView(color: phoneticsColor, progressCount: 1, totalQuestion: 15)
}
