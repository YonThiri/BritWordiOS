//
//  TestView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct TestStartView: View {
    
    // MARK: - PROPERTIES
    @State private var showFillTheBlankSheet : Bool = false
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack(spacing: 20) {
                
                // MARK: - NAVIGATION TITLE
                NavigationHeaderView(
                    title: "Test")
                
                Spacer()
                
                // MARK: - START VIEW
                ExerciseStartView(
                    title: "Are you ready to take a test?",
                    imageName: "test",
                    color: phoneticsColor)
                
                // MARK: - START BUTTON
                Button(action: {
                    
                    showFillTheBlankSheet.toggle()
                    
                }, label: {
                    ButtonView(
                        color: testColor,
                        buttonTitle: "Start")
                })
                .buttonStyle(tapBounceButtonStyle())
                
                Spacer()
                
            }
            .fullScreenCover(isPresented: $showFillTheBlankSheet, content: {
                
                FillTheBlankView()
            })
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TestStartView()
}

