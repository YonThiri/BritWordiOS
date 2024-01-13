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
    
    var body: some View {
        
        ZStack {
            
            // MARK: - BACKGROUND
            Rectangle()
                .fill(backgroundColor)
                .ignoresSafeArea()
            
            VStack{
                
                // MARK: - PROFILE
                ProfileView()
                    .padding(.horizontal, 20)
                
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading) {
                        
                        // MARK: - WORD OF THE DAY
                        WordOfTheDayView()
                            .padding(.top, 10)
                        
                        // MARK: - COURSES
                        Text("Courses")
                            .modifier(HeaderTitleModifier())
                            .padding(.top, 20)
                        
                        Group {
                            HStack {
                                
                                // MARK: - VOCABULARY
                                CoursesView(
                                    maxRadius: 30,
                                    minRadius: 5,
                                    maxCorners: [.topLeft, .bottomRight],
                                    minCorners: [.topRight, .bottomLeft],
                                    title: "Vocabulary",
                                    description: "Expand your word",
                                    image: "vocabulary",
                                    color: vocabularyColor)
                                    
                                
                                // MARK: - PHONETICS
                                CoursesView(
                                    maxRadius: 30,
                                    minRadius: 5,
                                    maxCorners: [.topRight, .bottomLeft],
                                    minCorners: [.topLeft, .bottomRight],
                                    title: "Phonetics",
                                    description: "Speak the sounds",
                                    image: "phonetics",
                                    color: phoneticsColor)
                                
                                
                            }//: HSTACK
                            
                            HStack {
                                
                                // MARK: - LISTENING
                                CoursesView(
                                    maxRadius: 30,
                                    minRadius: 5,
                                    maxCorners: [.topRight, .bottomLeft],
                                    minCorners: [.topLeft, .bottomRight],
                                    title: "Listening",
                                    description: "Listen to learn",
                                    image: "listening",
                                    color: listeningColor)
                                
                                // MARK: - DIFFERENT WORDS
                                CoursesView(
                                    maxRadius: 30,
                                    minRadius: 5,
                                    maxCorners: [.topLeft, .bottomRight],
                                    minCorners: [.topRight, .bottomLeft],
                                    title: "American Vs British",
                                    description: "Words unite worlds",
                                    image: "differentWords",
                                    color: differentColor)
                                
                            }//: HSTACK
                        }
                        
                        // MARK: - EXERCISES
                        Text("Exercises")
                            .modifier(HeaderTitleModifier())
                            .padding(.top, 20)
                        
                        HStack {
                            
                            ExerciseView(title: "Test", image: "test", color: vocabularyColor)
                            
                            ExerciseView(title: "Quiz", image: "quiz", color: quizColor)
                            
                            ExerciseView(title: "FlashCard", image: "flashCard", color: flashColor)
                        }
                        
                    }//: VSTACK
                    
                    .padding(.horizontal, 20)
                    
                }//: SCROLL
                
            }
            
            
        }//: ZSTACK
    }
    
}

#Preview {
    HomeView()
}
