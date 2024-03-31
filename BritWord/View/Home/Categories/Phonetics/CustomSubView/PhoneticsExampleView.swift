//
//  PhoneticsExampleView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct PhoneticsExampleView: View {
    
    // MARK: - PROPERTIES
    var examples : [Example]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // MARK: - EXAMPLE TITLE
            Text("Example")
                .font(descriptionText)
                .foregroundStyle(grayColor)
            
            
            // MARK: - EXAMPLE WORDS
            VStack(alignment: .leading) {
                  
                ForEach(Array(examples.enumerated()), id: \.1.id) { index, example in
                        
                    PhoneticsExampleItemView(
                        example: example,
                        index: index + 1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(whiteColor)
            )
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    PhoneticsExampleView(examples: vowelPhoneticLists.phoneticsList[0].example)
}
