//
//  FlashCardChoiceButtonView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct FlashCardChoiceButtonView: View {
    
    // MARK: - PROPERTIES
    var image : String
    
    var body: some View {
        
        // MARK: - CHOICE BUTTON
        ZStack(alignment: .top) {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(backgroundColor)
                .modifier(ShadowViewModifier())
            
            VStack(spacing: 0){
                
                // MARK: - WORD OF THE DAY TITLE
                Image(image)
                    .font(title1)
                    .padding(.top, 18)
                
                
            }//: VSTACK
            .foregroundStyle(.black)
            
        }//: ZSTACK
        .frame(maxWidth: .infinity)
        .frame(width: 80, height: 80)
        
    }
}

#Preview {
    FlashCardChoiceButtonView(image: "wrong")
}
