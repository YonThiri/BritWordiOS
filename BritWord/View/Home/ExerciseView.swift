//
//  ExerciseView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 05/01/2024.
//

import SwiftUI

struct ExerciseView: View {
    
    // MARK: - PROPERTIES
    var title : String
    var image : String
    var color : Color
    
    var body: some View {
        
        Button(action: {
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(color)
                VStack{
                    
                    Spacer()
                    
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                    
                    Spacer()
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(whiteColor.opacity(0.5))
                            .blur(radius: 0.5)
                        
                        Text(title)
                            .font(subTitle)
                    }
                    .frame(height: 50)
                    
                }
                
            }
            
            .frame(height: 160)
        })
        .buttonStyle(tapBounceButtonStyle())
        
    }
}

#Preview {
    ExerciseView(title: "Test", image: "title", color: vocabularyColor)
}
