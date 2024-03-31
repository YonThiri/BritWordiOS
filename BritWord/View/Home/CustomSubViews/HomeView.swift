//
//  HomeView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @State private var isPressed : Bool = false
    @State var homeDestinationModel : HomeCoursesDestination? = nil
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                // MARK: - BACKGROUND
                backgroundColor
                
                VStack(spacing: 0){
                    
                    // MARK: - HEADER
                    HeaderView()
                        
                    ScrollView(.vertical) {
                        
                        VStack(alignment: .leading) {
                            
                            // MARK: - COURSES
                            VStack(alignment: .leading, spacing: 18) {
                                
                                // MARK: - COURSES TITLE
                                HomeTitleView(title: "Courses")
                                
                                HStack {
                                    
                                    // MARK: - Beginner
                                    CoursesView(
                                        title: "Beginner",
                                        image: "beginner",
                                        color: beginnerColor,
                                        destinationSheet: .beginner)
                                        
                                    
                                    // MARK: - Elementary
                                    CoursesView(
                                        title: "Elementary",
                                        image: "elementary",
                                        color: elementaryColor,
                                        destinationSheet: .elementary)
                                    
                                    
                                }//: HSTACK
                                
                                HStack {
                                    
                                    // MARK: - PRE-INTERMEDIATE
                                    CoursesView(
                                        title: "Pre-Intermediate",
                                        image: "preInter",
                                        color: preInterColor,
                                        destinationSheet: .preInter)
                                        
                                    
                                    // MARK: - INTERMEDIATE
                                    CoursesView(
                                        title: "Intermediate",
                                        image: "intermediate",
                                        color: interColor,
                                        destinationSheet: .intermediate)
                                    
                                    
                                }//: HSTACK
                               
                            }//: COURSES
                            .padding(.top, objectTopPadding)
                            
                            
                            // MARK: - CATEGORIES
                            VStack(alignment: .leading, spacing: 18) {
                                
                                // MARK: - CATEGORIES TITLE
                                HomeTitleView(title: "Categories")
                                
                                HStack {
                                    
                                    CategoriesView(
                                        title: "Phonetics",
                                        description: "Speak the sounds",
                                        image: "phonetics",
                                        color: phoneticsColor,
                                        destinationSheet: .phonetics)
                                    
                                    CategoriesView(
                                        title: "American Vs British", 
                                        description: "Words unite worlds",
                                        image: "differentWords",
                                        color: differentColor,
                                        destinationSheet: .differentWords)
                                }
                            }//: CATEGORIES
                            .padding(.top, objectTopPadding)
                            
                            // MARK: - EXERCISES COMING SOON
                            VStack(alignment: .leading, spacing: 18) {
                                
                                // MARK: - EXERCISES TITLE
                                HomeTitleView(title: "Exercises")
                                
                                VStack {
                                    
                                    ExercisesView(
                                        title: "Test",
                                        description: "Quick English vocab test ahead!",
                                        image: "test",
                                        color: testColor,
                                        destinationSheet: .test)
                                    
                                    ExercisesView(
                                        title: "Quiz",
                                        description: "Engage in an English quiz!",
                                        image: "quiz",
                                        color: quizColor,
                                        destinationSheet: .quiz)
                                    
                                    ExercisesView(
                                        title: "Flash Card",
                                        description: "Flashcard your way through English!",
                                        image: "flashCard",
                                        color: flashColor,
                                        destinationSheet: .flashCard)
                                }
                            }//: EXERCISES
                            .padding(.top, objectTopPadding)
                            
                            
                            
                        }//: VSTACK
                        
                        .padding(.horizontal, objectTopPadding)
                        .padding(.bottom)
                        
                    }//: SCROLL
                    .scrollIndicators(.hidden)
                }
                
                
            }//: ZSTACK
            .ignoresSafeArea()
        }//: NAVIGATION
        .toolbar(.hidden)
        
        
    }
    
}

#Preview {
    HomeView()
}
