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
    @State private var isPressed: Bool = false
    @State var homeDestinationModel: HomeCoursesDestination? = nil
    @StateObject private var newDayChecker = NewDayChecker()
    @EnvironmentObject var diContainer: DIContainer
    
    @StateObject private var viewModel: PodcastsViewModel

    init() {
        _viewModel = StateObject(wrappedValue: PodcastsViewModel(supabaseService: DIContainer().supabaseService))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // MARK: - BACKGROUND
                backgroundColor
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    ScrollView(.vertical) {
                        
                        VStack(alignment: .leading) {
                            
                            // MARK: - DAILY STREAK
                            VStack(alignment: .leading, spacing: 18) {
                                DailyStreakView()
                            }
                            .padding(.top, objectTopPadding)
                            .padding(.horizontal, objectTopPadding)
                            
                            // MARK: - CATEGORIES
                            VStack(alignment: .leading, spacing: 18) {
                                
                                // MARK: - CATEGORIES TITLE
                                HomeTitleView(title: "Categories")
                                
                                VStack(spacing: 10) {
                                    HStack {
                                        
                                        NavigationLink(destination: PhoneticsView()) {
                                            CategoriesView(
                                                title: "Phonetics",
                                                description: "Speak the sounds",
                                                image: "phonetics",
                                                color: phoneticsColor)
                                        }
                                        .buttonStyle(tapBounceButtonStyle())
                                        
                                        NavigationLink(destination: TrackListView(podcasts: viewModel.podcasts)) {
                                            CategoriesView(
                                                title: "Listening",
                                                description: "Engaging English Story",
                                                image: "stories",
                                                color: storyColor)
                                        }
                                        .buttonStyle(tapBounceButtonStyle())
                                    }
                                    
                                    HStack {
                                        NavigationLink(destination: DifferentWordsView().environmentObject(diContainer)) {
                                            CategoriesView(
                                                title: "American Vs British",
                                                description: "Words unite worlds",
                                                image: "differentWords",
                                                color: differentColor)
                                        }
                                        .buttonStyle(tapBounceButtonStyle())
                                    }
                                }
                            }//: CATEGORIES
                            .padding(.top, objectTopPadding)
                            .padding(.horizontal, objectTopPadding)
                            
                            // MARK: - NEW RELEASED
                            VStack(alignment: .leading, spacing: 18) {
                                
                                // MARK: - NEW RELEASED
                                HomeTitleView(title: "New Released")
                                    .padding(.horizontal, objectTopPadding)
                                
                                ScrollView(.horizontal) {
                                    LazyHStack {
                                        ForEach(viewModel.newReleased) { podcast in
                                            
                                            NewReleasedView(title: podcast.title, imageURL: podcast.image, createdDate: podcast.createdDate)
                                            
                                        }
                                    }
                                }
                                
                                
                            }
                            .padding(.top, objectTopPadding)
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
        }//: NAVIGATION
        .onAppear(perform: {
            
            newDayChecker.checkConditions(
                onNewDay: { message in
                    print("new \(message) \(newDayChecker.dailyStreakCount)")
                    newDayChecker.isStartDay = true
                    //newDayChecker.dailyStreakCount += 1
                },
                onSameDay: { message in
                    print("same \(message) \(newDayChecker.dailyStreakCount)")
                    newDayChecker.isStartDay = false
                },
                onDifferentDay: { message in
                    print("different \(message) \(newDayChecker.dailyStreakCount)")
                    newDayChecker.isStartDay = true
                   // newDayChecker.dailyStreakCount = 0
                }
            )

        })
        .task {
            
            viewModel.fetchPodcasts()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DIContainer())
}
