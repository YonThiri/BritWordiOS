//
//  PhoneticsView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/04/01/2024.
//

import SwiftUI

struct PhoneticsView: View {
    
    // MARK: - PROPERTIES
    

    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack(spacing: 0) {
                NavigationHeaderView()
                
                ScrollView {
                    
                    // VOWELS
                    PhoneticsListView(
                        title: "Vowels",
                        phonetics: vowelPhoneticLists)
                    
                    // DIPTHONGS
                    PhoneticsListView(
                        title: "Dipthongs",
                        phonetics: diphthongsPhoneticLists)
                    
                    // CONSONENTS
                    PhoneticsListView(
                        title: "Consonents",
                        phonetics: consonantsPhoneticLists)
                        .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 20)
            }
            .navigationBarBackButtonHidden(true)
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
