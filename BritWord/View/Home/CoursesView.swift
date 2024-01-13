//
//  CoursesView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 05/01/2024.
//

import SwiftUI

struct CoursesView: View {
    
    // MARK: - PROPERTIES
    var maxRadius: CGFloat
    var minRadius: CGFloat
    var maxCorners: UIRectCorner
    var minCorners: UIRectCorner
    var title : String
    var description : String
    var image : String
    var color : Color
    var destinationSheet : HomeCoursesDestination
    
    @State private var isPressed: Bool = false
    @State private var sheetType: HomeCoursesDestination?
    
    var body: some View {
        
        Button(action: {
            
            self.isPressed.toggle()
            sheetType = destinationSheet
        }) {
            
            ZStack(alignment: .bottomTrailing){
                
                ZStack(alignment: .topLeading){
                    Rectangle()
                        .fill(color)
                        .clipShape(RoundedCustomShape(radius: maxRadius, corners: maxCorners))
                        .clipShape(RoundedCustomShape(radius: minRadius, corners: minCorners))
                    
                    VStack(alignment: .leading) {
                        
                        Text(title)
                            .font(subTitle)
                            .foregroundStyle(whiteColor)
                        
                        Text(description)
                            .font(bodyText)
                            .foregroundStyle(whiteColor)
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                }
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 120)
                    .offset(x: 18, y: 28)
                    .clipped()
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .animation(.spring, value: isPressed)
            .clipShape(RoundedCustomShape(radius: maxRadius, corners: maxCorners))
            .clipShape(RoundedCustomShape(radius: minRadius, corners: minCorners))
            
            .fullScreenCover(isPresented: $isPressed, content: {
                sheetContent()
            })
            
        }
        .buttonStyle(tapBounceButtonStyle())
        
    }
    
    @ViewBuilder
    func sheetContent() -> some View {
        
        if let type = sheetType {
            
            switch type {
                
            case .vocabulary:
                ChapterListView()
            case .phonetics:
                PhoneticsView()
            case .listening:
                ListeningListsView()
            case .differentWords:
                DifferentWordsView()
            
            }
        }
    }
}

#Preview {
    CoursesView(maxRadius: 30, minRadius: 5, maxCorners: [.topLeft, .bottomRight], minCorners: [.topRight, .bottomLeft],title: "Vocabulary", description: "Expand your word", image: "listening", color: vocabularyColor, destinationSheet: .differentWords)
}
