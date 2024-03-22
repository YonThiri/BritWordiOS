//
//  CoursesView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 05/01/2024.
//

import SwiftUI

struct CoursesView: View {
    
    // MARK: - PROPERTIES
    var title : String
    var image : String
    var color : Color
    var destinationSheet : HomeCoursesDestination
    
    @State private var isPressed: Bool = false
    @State private var sheetType: HomeCoursesDestination?
    
    var body: some View {
        
        Button(action: {
            
            self.isPressed.toggle()
            sheetType = destinationSheet
        }) {
            
            ZStack(alignment: .leading){
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                
                HStack(alignment: .center, spacing: 10) {
                    
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                    
                    Text(title)
                        .font(descriptionText)
                        .foregroundStyle(whiteColor)
                        .minimumScaleFactor(0.8)
                
                }
                .padding(.leading, 25)
                .padding(.trailing, 5)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .animation(.spring, value: isPressed)
            
            .fullScreenCover(isPresented: $isPressed, content: {
                sheetContent()
            })
            
        }
        .buttonStyle(tapBounceButtonStyle())
        
    }
    
    @ViewBuilder
    func sheetContent() -> some View {
        
        if let type = sheetType {
            
            switch type {
                
            case .vocabulary:
                ChapterListView()
            case .phonetics:
                PhoneticsView()
            case .differentWords:
                DifferentWordsView()
            
            }
        }
    }
}

#Preview {
    CoursesView(title: "Beginner", image: "preInter", color: beginnerColor, destinationSheet: .differentWords)
}
