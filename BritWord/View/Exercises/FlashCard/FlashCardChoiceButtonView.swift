//
//  FlashCardChoiceButtonView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct FlashCardChoiceButtonView: View {
<<<<<<< HEAD
    
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
        
=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
<<<<<<< HEAD
    FlashCardChoiceButtonView(image: "wrong")
=======
    FlashCardChoiceButtonView()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
