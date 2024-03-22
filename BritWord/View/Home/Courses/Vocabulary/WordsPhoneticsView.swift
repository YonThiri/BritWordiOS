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
    var myanmarMeaning : String
    
    var body: some View {
        
        // MARK: - WORD
        Text(word)
            .font(subTitle)
            .foregroundStyle(phoneticsColor)
        
        // MARK: - PHONETICS
        Text(phonetics)
            .font(descriptionText)
            .foregroundStyle(phoneticsColor)
        
        // MARK: - MYANMAR MEANING
        Text(myanmarMeaning)
            .font(subTitle)
            .foregroundStyle(phoneticsColor)
    }
}

#Preview {
    
    WordsPhoneticsView(word: "Hello", phonetics: "/he'l/", myanmarMeaning: "မင်္ဂလာပါ")
}
