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
<<<<<<< HEAD
                
                // MARK: - PROGRESS VIEW
                LearningProgressView(color: vocabularyColor)
                
                VStack{
                    
                    // MARK: - WORD & PHONETICS & MYANMAR MEANING
                    WordsPhoneticsView(
                        word: "Hello",
                        phonetics: "/he'l/",
                        myanmarMeaning: "မင်္ဂလာပါ")
                    
                    // MARK: - IMAGE AND SOUND PLAYER VIEW
=======
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
                    
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                    VStack {
                        Image("placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: .infinity)
                        
<<<<<<< HEAD
                        // MARK: - SOUND PLAYER
=======
                        
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
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

<<<<<<< HEAD
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
=======
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .background(
                        
                        RoundedRectangle(cornerRadius: 15)
                    )
                }
                
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(0..<3, id: \.self) { item in
                            
                            Text("1. Greeting someone for the first time")
                                .font(descriptionText)
                                .foregroundStyle(vocabularyColor)
                                
                        }
                    }
<<<<<<< HEAD
                }//: USAGE
=======
                }
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
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
