//
//  ChapterItemView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct ChapterItemView: View {
    
    var body: some View {
        
        ZStack{
            
            // BACKGROUND
            RoundedRectangle(cornerRadius: 15)
                .fill(whiteColor)
            
            HStack(alignment: .center, spacing: 20) {
                
                // MARK: - WORD IMAGE
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text("Greetings")
                    .font(subTitle)
                    .foregroundStyle(blackColor)
            }
            //: CHAPTER TITLE AND IMAGE
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(height: 120)
    }
}

#Preview {
    ChapterItemView()
    
}
