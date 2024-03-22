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
    @StateObject var differentWordVm = DifferentWordsViewModel()
    
    var body: some View {
        ZStack {
            
            backgroundColor
            
            VStack(spacing: 0) {
                
                // MARK: - NAVIGATION
                NavigationHeaderView(
                    title: "Vocabulary")
                
                // MARK: - CHAPTER LIST
                List {
                    
                    ForEach(differentWordVm.differentWordLists) { item in
                        
                        ChapterItemView()
                           .foregroundStyle(grayColor)
                           .onTapGesture {
                               vocabularyShowSheet = true
                           }
                           .listRowBackground(backgroundColor)
                           .listRowSeparator(.hidden)
                        
                    }
                    .fullScreenCover(isPresented: $vocabularyShowSheet, content: {
                        LearnVocabularyView()
                    })
                        
                }//: List
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
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
