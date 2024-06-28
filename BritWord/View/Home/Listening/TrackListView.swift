//
//  ChapterListView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/04/01/2024.
//

import SwiftUI
import Lottie

struct TrackListView: View {
    // MARK: - PROPERTIES
    var podcasts : [PodcastsModel]
    @State private var selectedIndex: Int = 0
    @State var isPresented : Bool = false
    
    var body: some View {
        ZStack {
            
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: - NAVIGATION
                NavigationHeaderView()
                
                // MARK: - CHAPTER LIST
                List {
                    
                    ForEach(Array(podcasts.enumerated()), id: \.element.id) {
                        index,
                        podcast in
                        
                        TrackItemView(
                            podcasts: podcasts,
                            imageURL: podcast.image,
                            title: podcast.title,
                            sound: podcast.audio, 
                            duration: podcast.duration)
                        .foregroundStyle(
                            grayColor
                        )
                        .listRowBackground(
                            backgroundColor
                        )
                        .listRowSeparator(
                            .hidden
                        )
                        .listRowInsets(
                            .init(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0
                            )
                        )

                        .onTapGesture {
                            
                            selectedIndex = index
                            isPresented = true
                            print("selected \(selectedIndex)")
                        }
                        
                    }

                }//: List
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                .padding(.bottom, 20)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            PlayerView(podcasts: podcasts, index: $selectedIndex)
        })
    }
}

#Preview {
    TrackListView(podcasts: [])
}
