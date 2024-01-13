//
//  ExerciseStartView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct ExerciseStartView: View {
    
    // MARK: - PROPERTIES
    var title : String
    var imageName : String
    var color : Color
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text(title)
<<<<<<< HEAD
                .font(descriptionText)
=======
                .font(title1)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                .foregroundStyle(blackColor)
                .multilineTextAlignment(.center)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            
        }
        
    }
}

#Preview {
    ExerciseStartView(title: "Are you ready", imageName: "test", color: vocabularyColor)
}
