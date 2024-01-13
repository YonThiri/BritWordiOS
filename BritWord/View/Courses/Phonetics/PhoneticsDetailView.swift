//
//  PhoneticsDetailview.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct PhoneticsDetailview: View {
    var body: some View {
<<<<<<< HEAD
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
=======
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
    PhoneticsDetailview()
}
