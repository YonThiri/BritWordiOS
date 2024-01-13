//
//  WordOfTheDayView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct WordOfTheDayView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(backgroundColor)
                .modifier(ShadowViewModifier())
            
            VStack(spacing: 0){
                
                // MARK: - WORD OF THE DAY TITLE
                Text("Word of the day")
                    .font(title1)
                    .padding(.top, 20)
                
                // MARK: - WORD OF THE DAY TEXT
                VStack(alignment: .leading) {
                    Text("Hit the sack")
                        .font(title1)
                        .foregroundStyle(.accent)
                    
                    // MARK: - WORD OF THE DAY MEANING
                    HStack {
                        
                        Text("meaning - ")
                            .font(bodyText)
                        
                        Text("Go to bed")
                            .font(title1)
                    }//: HSTACK
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 20)
                
            }//: VSTACK
            .foregroundStyle(.black)
            
        }//: ZSTACK
        .frame(maxWidth: .infinity)
        .frame(height: 180)
    }
}

#Preview {
    WordOfTheDayView()
}
