//
//  ExerciseView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 05/04/01/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - PROPERTIES
    var title : String
    var description : String
    var image : String
    var color : Color
    
    var body: some View {
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
                        .font(AppFont.body)
                        .minimumScaleFactor(0.01)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .foregroundStyle(blackColor)
                    
                    Text(description)
                        .font(AppFont.footnote2)
                        .foregroundStyle(exerciseSecondaryTextColor)
                }
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 180)
        
    }
    
}

#Preview {
    CategoriesView(title: "Phonetics", description: "Speak the sounds", image: "phonetics", color: phoneticsColor)
}
