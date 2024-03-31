//
//  LearnVocabularyView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct LearnVocabularyView: View {
    
    // MARK: - PROPERTIES
    @StateObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack {
                
                // MARK: - PROGRESS VIEW
                LearningProgressView(color: beginnerColor, progressCount: 1, totalQuestion: totalQuestion)
                
                VStack {
                    
                    // MARK: - WORD & PHONETICS & MYANMAR MEANING
                    WordsPhoneticsView(
                        word: "Hello",
                        phonetics: "/he'l/")
                    
                    VStack(spacing: 20) {
                        
                        // MARK: - IMAGE AND SOUND PLAYER VIEW
                        ZStack(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                            
                            Image("placeholder")
                                .resizable()
                                .scaledToFit()
                            
                            // MARK: - SOUND PLAYER
                            SoundPlayerView(color: Color.accentColor, soundName: "", pathFromFirebase: "", audioPlayer: audioPlayer)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                        
                        // MARK: - USAGE
                        ScrollView {
                            VStack(spacing: 15) {
                                ForEach(0..<3, id: \.self) { item in
                                    
                                    Text("1. Greeting someone for the first time")
                                        .font(descriptionText)
                                        .foregroundStyle(Color.accentColor)
                                        
                                }
                            }
                        }//: USAGE
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                }
                
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
