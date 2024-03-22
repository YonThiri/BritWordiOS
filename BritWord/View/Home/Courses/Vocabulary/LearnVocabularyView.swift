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
                
                // MARK: - PROGRESS VIEW
                LearningProgressView(color: phoneticsColor)
                
                VStack{
                    
                    // MARK: - WORD & PHONETICS & MYANMAR MEANING
                    WordsPhoneticsView(
                        word: "Hello",
                        phonetics: "/he'l/",
                        myanmarMeaning: "မင်္ဂလာပါ")
                    
                    // MARK: - IMAGE AND SOUND PLAYER VIEW
                    VStack {
                        Image("placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: .infinity)
                        
                        // MARK: - SOUND PLAYER
                        ZStack(alignment: .leading) {
                            

                            Button {
                                
                            } label: {
                                Image("play")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                            .buttonStyle(tapBounceButtonStyle())
                            .padding(.leading, 20)

                        }//: SOUND PLAYER
                        
                    }//: IMAGE AND SOUND PLAYER VIEW
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(whiteColor)
                    )
                }
                
                // MARK: - USAGE
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(0..<3, id: \.self) { item in
                            
                            Text("1. Greeting someone for the first time")
                                .font(descriptionText)
                                .foregroundStyle(phoneticsColor)
                                
                        }
                    }
                }//: USAGE
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
