//
//  ResultView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 12/01/2024.
//

import SwiftUI

struct ResultView: View {
    
    var body: some View {
        
        ZStack {
            backgroundColor
            LottieView(filename: "confetti_effect")
            
            // MARK: - CONTENT
            VStack {
                
                // MARK: - HEADER
                Text("Lesson Complete")
                    .font(headerTitle)
                    .foregroundStyle(blackColor)
                
                LottieView(filename: "result_animation")
                    .frame(height: 180)
                    .padding(.vertical, 40)
                
                // MARK: - CORRECT PERCENTAGE
                HStack(spacing: 15) {
                    
                    Text("Correct")
                        .font(descriptionText)
                    
                    Spacer()
                    
                    HStack {
                        Image("result_correct")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        Text("80%")
                            .font(subTitle)
                            .foregroundStyle(Color.accentColor)
                    }
                }//: CORRECT PERCENTAGE
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(whiteColor)
                )
                
                // MARK: - SEE YOU AGAIN
                Button(action: {
                    
                }, label: {
                    ButtonView(color: Color.accentColor, buttonTitle: "SEE YOU AGAIN")
                })
                .buttonStyle(tapBounceButtonStyle())
                .padding(.top)
            }//: CONTENT
            .padding()
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ResultView()
}
