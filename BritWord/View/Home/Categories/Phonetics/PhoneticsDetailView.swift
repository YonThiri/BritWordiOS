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
    @Binding var buttonText : String
    @Binding var isFirstItem : Bool
    @Binding var isFinish : Bool
    
    var onIncrementIndex: () -> Void
    var onDecrementIndex: () -> Void
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack(spacing: 20) {
                
                // MARK: - NAVIGATION HEADER
                NavigationHeaderView(title: "Phonetics")
                
                VStack(spacing: 20) {
                    // MARK: - PHONETICS SYMBOL, TYPE & DESCRIPTION
                    PhoneticsSymbolView(
                        symbol: phonetic.word,
                        type: phonetic.description,
                        description: "To practice, you can try saying words that contain the \"\(phonetic.word)\" sound, such as:")
                    
                    // MARK: - PHONETICS EXAMPLE
                    PhoneticsExampleView(examples: phonetic.example)
                    
                    // MARK: - BACK & NEXT BUTTONS
                    HStack {
                        // MARK: - BACK
                        Button(action: {
                            
                            onDecrementIndex()
                            
                            if isFirstItem {
                                dismiss()
                            }
                            
                        }, label: {
                            Text("Back")
                                .font(subTitle)
                                .foregroundStyle(phoneticsTextColor)
                        })
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .buttonStyle(tapBounceButtonStyle())
                        
                        // MARK: - NEXT
                        Button(action: {
                            onIncrementIndex()
                            
                            if isFinish {
                                dismiss()
                            }
                            
                            
                        }, label: {
                            ButtonView(
                                color: phoneticsTextColor,
                                buttonTitle: buttonText)
                        })
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .buttonStyle(tapBounceButtonStyle())
                    }
                }
                .padding()
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    
    PhoneticsDetailview(phonetic: .constant(PhoneticModel(id: 1, word: "Example", description: "Example Description", explanation: "Example Explanation", example: [])), buttonText: .constant(""), isFirstItem: .constant(true), isFinish: .constant(false), onIncrementIndex: {}, onDecrementIndex: {})
                 
        
}
