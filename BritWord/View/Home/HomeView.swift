//
//  HomeView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI
import Lottie

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @StateObject private var newDayChecker = NewDayChecker()
    
    var podcasts: [PodcastsModel]
    var newReleased: [PodcastsModel]
    
    @EnvironmentObject var diContainer: DIContainer
    @State private var selectedIndex: Int = 0
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - BACKGROUND
                backgroundColor
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ScrollView(.vertical) {
                        LazyVStack(alignment: .leading) {
                            // MARK: - DAILY STREAK
                            dailyStreakView
                            
                            // MARK: - CATEGORIES
                            categoriesView
                            
                            // MARK: - NEW RELEASED
                            newReleasedView(selectedIndex: $selectedIndex, isPresented: $isPresented)
                        }//: VSTACK
                        .padding(.bottom)
                    }//: SCROLL
                    .scrollIndicators(.hidden)
                }
            }//: ZSTACK
            .navigationTitle("Britword")
            .navigationBarColor(backgroundColor: UIColor(backgroundColor), titleColor: .accent)
            .sheet(isPresented: $newDayChecker.isStartDay, onDismiss: {
                print("Dismiss")
            }, content: {
                DailyStreakAlertView(isStartDay: $newDayChecker.isStartDay)
                    .presentationDetents([.height(450)])
                    .presentationBackground(.clear)
                    .interactiveDismissDisabled()
            })
            .fullScreenCover(isPresented: $isPresented, content: {
                PlayerView(podcasts: newReleased, index: $selectedIndex)
            })
        }//: NAVIGATION
        .onAppear {
            newDayChecker.checkConditions(
                onNewDay: { message in
                    print("new \(message) \(newDayChecker.dailyStreakCount)")
                    newDayChecker.isStartDay = true
                },
                onSameDay: { message in
                    print("same \(message) \(newDayChecker.dailyStreakCount)")
                    newDayChecker.isStartDay = false
                },
                onDifferentDay: { message in
                    print("different \(message) \(newDayChecker.dailyStreakCount)")
                    newDayChecker.isStartDay = true
                }
            )
        }
    }
}

#Preview {
    HomeView(podcasts: [], newReleased: [])
        .environmentObject(DIContainer())
}

extension HomeView {
    //MARK: - EXTRACTED VIEWS
    
    // Daily Streak
    private var dailyStreakView : some View {
        VStack(alignment: .leading, spacing: 18) {
            DailyStreakView()
        }
        .padding(.top, objectTopPadding)
        .padding(.horizontal, objectTopPadding)
    }
    
    // Categories
    private var categoriesView : some View {
        VStack(alignment: .leading, spacing: 18) {
            
            // MARK: - CATEGORIES TITLE
            HomeTitleView(title: "Categories")
            
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    
                    NavigationLink(destination: PhoneticsView()) {
                        CategoriesView(
                            title: "Phonetics",
                            description: "Speak the sounds",
                            image: "phonetics",
                            color: phoneticsColor)
                    }
                    .buttonStyle(TapBounceButtonStyle())
                    
                    NavigationLink(destination: TrackListView(podcasts: podcasts)) {
                        CategoriesView(
                            title: "Listening",
                            description: "Engaging English Story",
                            image: "stories",
                            color: storyColor)
                    }
                    .buttonStyle(TapBounceButtonStyle())
                }
                
                HStack {
                    NavigationLink(destination: DifferentWordsView().environmentObject(diContainer)) {
                        CategoriesView(
                            title: "American Vs British",
                            description: "Words unite worlds",
                            image: "differentWords",
                            color: differentColor)
                    }
                    .buttonStyle(TapBounceButtonStyle())
                }
            }
        }//: CATEGORIES
        .padding(.top, objectTopPadding)
        .padding(.horizontal, objectTopPadding)
    }
    
    
    // New Released
    private func newReleasedView(selectedIndex: Binding<Int>, isPresented: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            // MARK: - NEW RELEASED
            HomeTitleView(title: "New Released")
                .padding(.horizontal, objectTopPadding)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(Array(newReleased.enumerated()), id: \.element.id) { index, podcast in
                        NewReleasedView(title: podcast.title, imageURL: podcast.image, createdDate: podcast.createdDate)
                            .onTapGesture {
                                selectedIndex.wrappedValue = index
                                isPresented.wrappedValue = true
                            }
                    }
                }
            }
        }
        .padding(.top, objectTopPadding)
    }


}
