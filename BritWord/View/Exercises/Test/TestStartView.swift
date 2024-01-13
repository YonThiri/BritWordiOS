//
//  TestView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

<<<<<<< HEAD
struct TestStartView: View {
=======
struct TestView: View {
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack {
                
                // MARK: - NAVIGATION TITLE
                NavigationHeaderView(
                    title: "Test",
                    description: "\"Challenge the Test, Embrace the Best.\"",
                    backgroundImage: "test_bg")
                
                Spacer()
                
                // MARK: - START VIEW
                ExerciseStartView(
                    title: "Are you ready to take a test?",
                    imageName: "test",
                    color: vocabularyColor)
                
<<<<<<< HEAD
                // MARK: - START BUTTON
                Button(action: {
                    
                }, label: {
                    ButtonView(
                        color: vocabularyColor,
                        buttonTitle: "Start")
                })
                .buttonStyle(tapBounceButtonStyle())
                
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                Spacer()
                
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
<<<<<<< HEAD
    TestStartView()
=======
    TestView()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
