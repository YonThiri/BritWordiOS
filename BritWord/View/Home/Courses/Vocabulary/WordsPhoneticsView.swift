//
//  WordsPhoneticsView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 12/01/2024.
//

import SwiftUI

struct WordsPhoneticsView: View {
    
    var word : String
    var phonetics : String
    
    var body: some View {
        
        // MARK: - WORD
        Text(word)
            .font(title1)
            .foregroundStyle(Color.accentColor)
        
        // MARK: - PHONETICS
        Text(phonetics)
            .font(descriptionText)
            .foregroundStyle(Color.accentColor)
        
    }
}

#Preview {
    
    WordsPhoneticsView(word: "Hello", phonetics: "/he'l/")
}
