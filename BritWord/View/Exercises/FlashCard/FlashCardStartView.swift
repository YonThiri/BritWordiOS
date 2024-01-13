//
//  FlashCardView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct FlashCardStartView: View {
    
    // MARK: - PROPERTIES
    @State private var isPressed : Bool = false
    
    var body: some View {
        ZStack {
            
            backgroundColor
            
            VStack {
                
                // MARK: - NAVIGATION TITLE
                NavigationHeaderView(
                    title: "Flash Card",
                    description: "\"Quick and Effective Learning: Dive into Flash Cards!\"",
                    backgroundImage: "flashCard_bg")
                
                Spacer()
                
                // MARK: - START VIEW
                ExerciseStartView(
                    title: "Fun Learning, Fast Results: The \nFlash Card Advantage.",
                    imageName: "flashCard",
                    color: flashColor)
                
                
                // MARK: - START BUTTON
                Button(action: {
                    isPressed = true
                }, label: {
                    ButtonView(
                        color: flashColor,
                        buttonTitle: "Start")
                })
                .buttonStyle(tapBounceButtonStyle())
                
                Spacer()
                
                
            }
            
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $isPressed, content: {
            FlashCardView()
        })
    }
}

#Preview {
    FlashCardStartView()
}
