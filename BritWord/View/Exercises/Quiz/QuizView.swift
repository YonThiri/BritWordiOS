//
//  QuizView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        ZStack {
            
            backgroundColor
            
            VStack {
                LearningProgressView(color: quizColor)
                
                Spacer()
                
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                
                VStack {
                    
                    // MARK: - CHOICE A
                    QuizChoiceButtonView()
                    
                    // MARK: - CHOICE B
                    QuizChoiceButtonView()
                    
                    // MARK: - CHOICE C
                    QuizChoiceButtonView()
                    
                    // MARK: - CHOICE D
                    QuizChoiceButtonView()
                    
                }
                .padding(.top, 40)
                
                Spacer()
            }
            .padding()
            .padding(.top, 60)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuizView()
}
