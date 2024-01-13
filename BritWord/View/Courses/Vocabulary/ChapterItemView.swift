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
            
<<<<<<< HEAD
            // MARK: - DOTTED LINE PROGRESS
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
            VStack(spacing: 0) {
                
                Circle()
                    .fill(grayColor)
                    .frame(width: 10, height: 10)
                
                DottedLineShape(stratPoint: .top, endPoint: .bottom)
                    .stroke(style: StrokeStyle(lineWidth: 1.0, dash: [5]))
                    .frame(width: 55)
                
<<<<<<< HEAD
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
=======
            }
            
            
            ZStack {
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                RoundedRectangle(cornerRadius: 15)
                    .fill(whiteColor)
                    .frame(maxWidth: .infinity)
                
<<<<<<< HEAD
            )
            .padding(.bottom, 30)
            
=======
                HStack(spacing: 15) {
                    
                    Image("placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Text("Greetings")
                        .font(subTitle)
                        .foregroundStyle(blackColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                
                
            }
            .padding(.bottom, 30)
            
                
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
        }
        .frame(height: 150)
    }
}

#Preview {
    ChapterItemView()
}
