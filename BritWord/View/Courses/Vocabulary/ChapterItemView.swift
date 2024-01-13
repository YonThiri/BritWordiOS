//
//  ChapterItemView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct ChapterItemView: View {
    
    var body: some View {
        
        HStack {
            
            // MARK: - DOTTED LINE PROGRESS
            VStack(spacing: 0) {
                
                Circle()
                    .fill(grayColor)
                    .frame(width: 10, height: 10)
                
                DottedLineShape(stratPoint: .top, endPoint: .bottom)
                    .stroke(style: StrokeStyle(lineWidth: 1.0, dash: [5]))
                    .frame(width: 55)
                
            } //: DOTTED LINE PROGRESS
            
            // MARK: - CHAPTER TITLE AND IMAGE
            HStack(spacing: 15) {
                
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text("Greetings")
                    .font(subTitle)
                    .foregroundStyle(blackColor)
            }//: CHAPTER TITLE AND IMAGE
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(whiteColor)
                    .frame(maxWidth: .infinity)
                
            )
            .padding(.bottom, 30)
            
        }
        .frame(height: 150)
    }
}

#Preview {
    ChapterItemView()
}
