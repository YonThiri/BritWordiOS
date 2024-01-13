//
//  PhoneticsSymbolView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct PhoneticsSymbolView: View {
<<<<<<< HEAD
    
    // MARK: - PROPERTIES
    var symbol : String
    var type : String
    var description : String
    
    var body: some View {
        
        VStack {
            
            // MARK: - PHONETICS SYMBOL & TYPE
            ZStack(alignment: .leading){
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(phoneticsColor)
                    .frame(height: 120)
                
                HStack(spacing: 20) {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(whiteColor)
                            .frame(width: 80, height: 80)
                        
                        Text(symbol)
                            .font(headerTitle)
                            .foregroundStyle(phoneticsColor)
                    }
                    
                    Text(type)
                        .font(subTitle)
                        .foregroundStyle(whiteColor)
                }
                .padding()
            }
            
            // MARK: - PHONETICS DESCRIPTION
            Text(description)
                .font(descriptionText)
                .foregroundStyle(blackColor)
        }
        
=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
<<<<<<< HEAD
    PhoneticsSymbolView(symbol: "i:", type: "Long Vowel", description: "To practice, you can try saying words that contain the \"æ\" sound, such as:")
=======
    PhoneticsSymbolView()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
