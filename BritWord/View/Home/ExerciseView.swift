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
<<<<<<< HEAD
    var destinationSheet : HomeExerciseDestination
    
    @State private var isPressed: Bool = false
    @State private var sheetType: HomeExerciseDestination?
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    
    var body: some View {
        
        Button(action: {
<<<<<<< HEAD
            self.isPressed.toggle()
            sheetType = destinationSheet
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
            
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
<<<<<<< HEAD
                            .foregroundStyle(whiteColor)
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                    }
                    .frame(height: 50)
                    
                }
                
            }
<<<<<<< HEAD
            .animation(.spring, value: isPressed)
            .frame(height: 160)
            .fullScreenCover(isPresented: $isPressed, content: {
                sheetContent()
            })
=======
            
            .frame(height: 160)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
        })
        .buttonStyle(tapBounceButtonStyle())
        
    }
<<<<<<< HEAD
    
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
=======
}

#Preview {
    ExerciseView(title: "Test", image: "title", color: vocabularyColor)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
