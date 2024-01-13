//
//  ChapterListView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct ChapterListView: View {
    // MARK: - PROPERTIES
    @State private var showSheetLevel : Bool = false
    @State private var vocabularyShowSheet : Bool = false
    
    var body: some View {
        ZStack {
            
            backgroundColor
            
            VStack {
                
                // MARK: - NAVIGATION
                NavigationHeaderView(
                    title: "Vocabulary",
                    description: "From Words to Wisdom: Enrich Your Vocabulary.",
                    backgroundImage: "vocabulary_bg")
                
                ScrollView {
                    
                    // MARK: - CHAPTER LIST CONTENT
                    VStack {
                        
                        // MARK: - LEVEL BUTTON
                        Button(action: {
                            showSheetLevel = true
                        }, label: {
                            
                            HStack {
                                Text("Beginner")
                                    .font(subTitle)
                                    
                                Image(systemName: "chevron.down")
                                    .fontWeight(.bold)
                            }
                        })
                        .foregroundStyle(vocabularyColor)
                        .buttonStyle(tapBounceButtonStyle())
                        
                        // MARK: - LEARNING PROGRESS
                        VStack(alignment: .leading, spacing: 0) {
                            Text("0%")
                                .font(subTitle)
                                
                            ProgressView(value: 0.5, total: 1)
                                .progressViewStyle(CustomProgressViewStyle(progressColor: vocabularyColor))
                        }//: LEARNING PROGRESS
                        .foregroundStyle(vocabularyColor)
                        
                        // MARK: - CHAPTER LIST
                        VStack(spacing: 0) {
                            ForEach(0..<8, id: \.self) { chapter in
                                
                                ChapterItemView()
                                    .foregroundStyle(grayColor)
                                    .onTapGesture {
                                        vocabularyShowSheet = true
                                    }
                                
                            }
                        }
                        .padding(.top, 20)
                        .fullScreenCover(isPresented: $vocabularyShowSheet, content: {
                            LearnVocabularyView()
                        })
                        
                    }//: CHAPTER LIST CONTENT
                    .padding()
                }
                
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showSheetLevel, content: {
            LevelSheetView()
                .presentationDetents([.height(300)])
                .presentationDragIndicator(.hidden)
        })
    }
}

#Preview {
    ChapterListView()
}
