//
//  LevelSheetView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct LevelSheetView: View {
    
    var body: some View {
        
        ZStack {
            
            whiteColor
            
            // MARK: - LEVELS
            VStack(alignment: .leading) {
                
                Image("british")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                // MARK: - BEGINNER
                BorderButtonView(color: vocabularyColor, buttonTitle: "Beginner")
                
                // MARK: - ELEMENTARY
                BorderButtonView(color: vocabularyColor, buttonTitle: "Elementary")
                
                // MARK: - PRE_INTERMEDIATE
                BorderButtonView(color: vocabularyColor, buttonTitle: "Pre-Intermediate")
                
                // MARK: - INTERMEDIATE
                BorderButtonView(color: vocabularyColor, buttonTitle: "Intermediate")
                
            }//: LEVELS
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LevelSheetView()
}
