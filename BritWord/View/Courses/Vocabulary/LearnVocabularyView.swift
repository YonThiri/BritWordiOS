//
//  LearnVocabularyView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct LearnVocabularyView: View {
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack {
                LearningProgressView(color: vocabularyColor)
                
                VStack{
                    Text("Hello")
                        .font(subTitle)
                        .foregroundStyle(vocabularyColor)
                    
                    Text("/he'l/")
                        .font(descriptionText)
                        .foregroundStyle(vocabularyColor)
                    
                    Text("မင်္ဂလာပါ")
                        .font(subTitle)
                        .foregroundStyle(vocabularyColor)
                    
                    VStack {
                        Image("placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: .infinity)
                        
                        
                        ZStack(alignment: .leading) {
                            RoundedCustomShape(radius: 15, corners: [.bottomLeft, .bottomRight])
                                .fill(vocabularyColor)
                                .frame(height: 40)
                            
                            Button {
                                
                            } label: {
                                Image("play")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                            .buttonStyle(tapBounceButtonStyle())
                            .padding(.leading, 20)

                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .background(
                        
                        RoundedRectangle(cornerRadius: 15)
                    )
                }
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(0..<3, id: \.self) { item in
                            
                            Text("1. Greeting someone for the first time")
                                .font(descriptionText)
                                .foregroundStyle(vocabularyColor)
                                
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }
            .padding()
            .padding(.top, 60)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LearnVocabularyView()
}
