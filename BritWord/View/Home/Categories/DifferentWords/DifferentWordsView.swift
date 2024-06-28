//
//  DifferentWords.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/04/01/2024.
//

import SwiftUI
import Lottie

struct DifferentWordsView: View {
    
    @StateObject private var viewModel: DifferentWordsViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: DifferentWordsViewModel(supabaseService: DIContainer().supabaseService))
    }

    
    var body: some View {
        
        ZStack{
            
            Color(.differentBg)
                //.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: - HEADER
                NavigationHeaderView()
            
                // MARK: - Word List
                List{
                    ForEach(viewModel.differentWords) { item in
                        
                        DifferentWordsRowView(differentWord: item)
                            .padding(.top, objectTopPadding)
                            .listRowBackground(Color(.differentBg))
                            .listRowSeparator(.hidden)
                    }
                    
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                .overlay(
                    Group {
                        if viewModel.isLoading {
                            
                            LottieView(animation: .named("loading"))
                                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                                .frame(width: 250)
                            
                            
                        } else if let error = viewModel.error {
                            Text("Error: \(error.localizedDescription)")
                        }
                    }
                )
                
            }//: VSTACK
            .task {
                viewModel.fetchDifferentWords()
            }
        }//: ZSTACK
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    DifferentWordsView()
}
