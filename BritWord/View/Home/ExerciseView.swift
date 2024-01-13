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
    var destinationSheet : HomeExerciseDestination
    
    @State private var isPressed: Bool = false
    @State private var sheetType: HomeExerciseDestination?
    
    var body: some View {
        
        Button(action: {
            self.isPressed.toggle()
            sheetType = destinationSheet
            
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
                            .foregroundStyle(whiteColor)
                    }
                    .frame(height: 50)
                    
                }
                
            }
            .animation(.spring, value: isPressed)
            .frame(height: 160)
            .fullScreenCover(isPresented: $isPressed, content: {
                sheetContent()
            })
        })
        .buttonStyle(tapBounceButtonStyle())
        
    }
    
    @ViewBuilder
    func sheetContent() -> some View {
        
        if let type = sheetType {
            
            switch type {
                
            case .test:
                TestStartView()
            case .quiz:
                QuizStartView()
            case .flashCard:
                FlashCardStartView()
            }
        }
    }
}

#Preview {
    ExerciseView(title: "Test", image: "title", color: vocabularyColor, destinationSheet: .quiz)
}
