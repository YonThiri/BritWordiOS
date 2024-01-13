//
//  TestView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct TestView: View {
    
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
                
                Spacer()
                
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TestView()
}
