//
//  PhoneticsView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct PhoneticsView: View {
    
    // MARK: - PROPERTIES
    
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack {
                NavigationHeaderView(
                    title: "Phonetics",
                    description: "\"Discover the Joy of Reading with Simple Sounds: Phonetics Makes Learning Words Easy and Fun!\"",
                    backgroundImage: "phonetics_bg")
                
                ScrollView {
                    
                    // VOWELS
                    PhoneticsListView(title: "Vowels")
                    
                    // DIPTHONGS
                    PhoneticsListView(title: "Dipthongs")
                    
                    // CONSONENTS
                    PhoneticsListView(title: "Consonents")
                        .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 20)
            }
            
        }
        .ignoresSafeArea()
    }
    
    func calculateItemHeight(for geometry: GeometryProxy) -> CGFloat {
            // You can customize this calculation based on your needs
            let itemWidth = (geometry.size.width) // Assuming 16 spacing between items in the LazyVGrid
            //let itemHeight = itemWidth * 0.75 // Adjust this ratio as needed

            return itemWidth
        }
}

#Preview {
    PhoneticsView()
}
