//
//  DifferentWords.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/01/2024.
//

import SwiftUI

struct DifferentWordsView: View {
    
    
    
    var body: some View {
        
        ZStack{
            
            backgroundColor
            
            VStack {
                
                // MARK: - HEADER
                NavigationHeaderView(
                    title: "American Vs British",
                    description: "\"Two Styles, One Language: American vs. British, Your Dual Mastery Journey.\"",
                    backgroundImage: "different_bg")
                
                List{
                    ForEach(0..<20, id: \.self) { item in
                        
                        ZStack(alignment: .top) {
                            
                            // BACKGROUND
                            RoundedRectangle(cornerRadius: 15)
                                .fill(whiteColor)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                // MARK: - WORD IMAGE
                                Image("placeholder")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 160)
                                    .clipped()
                                
                                // MARK: - AMERICAN WORD
                                DifferentWordTextView(
                                    meaning: "Chips",
                                    iconName: "american")
                                
                                
                                // MARK: - BRITISH WORD
                                DifferentWordTextView(
                                    meaning: "Crisps",
                                    iconName: "british")
                                
                            }//: IMAGE & TEXTS
                            .padding(20)
                        
                        }
                        .frame(height: 350)
                        .listRowBackground(backgroundColor)
                        .listRowSeparator(.hidden)
                    }
                }
                
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                
            }
            
        }
        .ignoresSafeArea()
        .navigationBarTitle("Detail", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    DifferentWordsView()
}
