//
//  PhoneticsDetailview.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct PhoneticsDetailview: View {
    
    // MARK: - PROPERTIES
    @Binding var phonetic : PhoneticModel
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack(spacing: 20) {
                
                // MARK: - NAVIGATION HEADER
                SimpleNavigationHeaderView(color: phoneticsColor)
                
                // MARK: - PHONETICS SYMBOL, TYPE & DESCRIPTION
                PhoneticsSymbolView(
                    symbol: phonetic.word,
                    type: phonetic.description,
                    description: "To practice, you can try saying words that contain the \"\(phonetic.word)\" sound, such as:")
                
                // MARK: - PHONETICS EXAMPLE
                PhoneticsExampleView(examples: phonetic.example)
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    
    PhoneticsDetailview(phonetic: .constant(PhoneticModel(id: 1, word: "Example", description: "Example Description", explanation: "Example Explanation", example: [])))
                        
    //PhoneticsDetailview(phonetic: <#Binding<PhoneticModel>#>)
    
        
}
