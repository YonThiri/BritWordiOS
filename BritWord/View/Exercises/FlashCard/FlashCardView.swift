//
//  FlashCardView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct FlashCardView: View {
<<<<<<< HEAD
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack {
                
                // MARK: - HEADER
                LearningProgressView(color: flashColor)
                
                Spacer()
                
                // MARK: - CARD
                VStack(spacing: 20) {
                    
                    Button {
                        
                    } label: {
                        Image("speaker")
                            .resizable()
                            .foregroundStyle(flashColor)
                            .frame(width: 35, height: 35)
                    }
                    .buttonStyle(tapBounceButtonStyle())
                    
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                    Text("Pizza")
                        .font(subTitle)
                        .foregroundStyle(blackColor)
                }
                .background(
                
                    RoundedRectangle(cornerRadius: 15)
                        .fill(whiteColor)
                        .frame(width: 280, height: 360)
                )
                    
                Spacer()
                
                // MARK: - CHOICE BUTTON
                HStack {
                    
                    FlashCardChoiceButtonView(image: "wrong")
                    
                    Spacer()
                    
                    FlashCardChoiceButtonView(image: "correct")
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
            }
            .padding()
            .padding(.top, 60)
            
        }
        .ignoresSafeArea()
        
=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
    FlashCardView()
}
