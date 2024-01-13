//
//  FlashCardView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

<<<<<<< HEAD
struct FlashCardStartView: View {
    
    // MARK: - PROPERTIES
    @State private var isPressed : Bool = false
    
=======
struct FlashCardView: View {
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
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
                
<<<<<<< HEAD
                
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
                
                
=======
                Spacer()
                
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
            }
            
        }
        .ignoresSafeArea()
<<<<<<< HEAD
        .fullScreenCover(isPresented: $isPressed, content: {
            FlashCardView()
        })
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
<<<<<<< HEAD
    FlashCardStartView()
=======
    FlashCardView()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
