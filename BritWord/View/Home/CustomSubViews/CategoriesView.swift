//
//  ExerciseView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 05/01/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - PROPERTIES
    var title : String
    var description : String
    var image : String
    var color : Color
    var destinationSheet : HomeCategoriesDestination
    
    @State private var isPressed: Bool = false
    @State private var sheetType: HomeCategoriesDestination?
    
    var body: some View {
        
        Button(action: {
            self.isPressed.toggle()
            sheetType = destinationSheet
            
        }, label: {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(color)
                
                VStack(alignment: .leading){
                    
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(subTitle)
                            .minimumScaleFactor(0.01)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                            .foregroundStyle(blackColor)
                            
                        
                        Text(description)
                            .font(bodyText)
                            .foregroundStyle(exerciseSecondaryTextColor)
                    }
                    
                }
                .padding(.horizontal, 15)
                
            }
            .animation(.spring, value: isPressed)
            .frame(height: 180)
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
                
            case .phonetics:
                PhoneticsView()
            case .differentWords:
                DifferentWordsView()
            }
        }
    }
}

#Preview {
    CategoriesView(title: "Phonetics", description: "Speak the sounds", image: "phonetics", color: phoneticsColor, destinationSheet: .phonetics)
}
