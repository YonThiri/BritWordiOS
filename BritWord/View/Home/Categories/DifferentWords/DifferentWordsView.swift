//
//  DifferentWords.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/01/2024.
//

import SwiftUI

struct DifferentWordsView: View {
    
    @StateObject var differentWordVm = DifferentWordsViewModel()
    
    var body: some View {
        
        ZStack{
            
            backgroundColor
            
            VStack(spacing: 0) {
                
                // MARK: - HEADER
                NavigationHeaderView(
                    title: "American Vs British")
            
                // MARK: - Word List
                List{
                    ForEach(differentWordVm.differentWordLists) { item in
                        
                        DifferentWordsRowView(differentWord: item)
                            .padding(.top, objectTopPadding)
                            .listRowBackground(backgroundColor)
                            .listRowSeparator(.hidden)
                    }
                    
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                
            }//: VSTACK
            .task {
                try? await differentWordVm.fetchDifferentWords()
            }
        }//: ZSTACK
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    DifferentWordsView(differentWordVm: DifferentWordsViewModel())
}
