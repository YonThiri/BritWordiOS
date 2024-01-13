//
//  PhoneticsDetailview.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct PhoneticsDetailview: View {
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack(spacing: 20) {
                
                // MARK: - NAVIGATION HEADER
                SimpleNavigationHeaderView(color: phoneticsColor)
                
                // MARK: - PHONETICS SYMBOL, TYPE & DESCRIPTION
                PhoneticsSymbolView(
                    symbol: "i:",
                    type: "Long Vowel",
                    description: "To practice, you can try saying words that contain the \"æ\" sound, such as:")
                
                // MARK: - PHONETICS EXAMPLE
                PhoneticsExampleView()
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PhoneticsDetailview()
}
