//
//  WordsPhoneticsView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 12/01/2024.
//

import SwiftUI

struct WordsPhoneticsView: View {
<<<<<<< HEAD
    
    var word : String
    var phonetics : String
    var myanmarMeaning : String
    
    var body: some View {
        
        // MARK: - WORD
        Text(word)
            .font(subTitle)
            .foregroundStyle(vocabularyColor)
        
        // MARK: - PHONETICS
        Text(phonetics)
            .font(descriptionText)
            .foregroundStyle(vocabularyColor)
        
        // MARK: - MYANMAR MEANING
        Text(myanmarMeaning)
            .font(subTitle)
            .foregroundStyle(vocabularyColor)
=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
<<<<<<< HEAD
    
    WordsPhoneticsView(word: "Hello", phonetics: "/he'l/", myanmarMeaning: "မင်္ဂလာပါ")
=======
    WordsPhoneticsView()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
