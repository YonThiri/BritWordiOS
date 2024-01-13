//
//  QuizView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct QuizStartView: View {
    
    // MARK: - PROPERTIES
    @State private var isPressed : Bool = false
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack {
                
                // MARK: - NAVIGATION TITLE
                NavigationHeaderView(
                    title: "Quiz",
                    description: "Dare to Quiz? Your Brain Will Thank You!",
                    backgroundImage: "quiz_bg")
                
                Spacer()
                
                // MARK: - START VIEW
                ExerciseStartView(
                    title: "Challenge Accepted: Test Your \nKnowledge with Our Quiz!",
                    imageName: "quiz",
                    color: quizColor)
                
                // MARK: - START BUTTON
                Button(action: {
                    
                    isPressed = true
                    
                }, label: {
                    ButtonView(
                        color: quizColor,
                        buttonTitle: "Start")
                })
                .buttonStyle(tapBounceButtonStyle())
                
                Spacer()
                
            }
            .fullScreenCover(isPresented: $isPressed, content: {
              
                QuizView()
            })
            
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    QuizStartView()
}
