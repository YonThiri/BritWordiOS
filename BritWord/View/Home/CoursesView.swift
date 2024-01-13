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
<<<<<<< HEAD
    var destinationSheet : HomeCoursesDestination
    
    @State private var isPressed: Bool = false
    @State private var sheetType: HomeCoursesDestination?
    
    var body: some View {
        
        Button(action: {
            
            self.isPressed.toggle()
            sheetType = destinationSheet
        }) {
            
=======
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        
        Button(action: { self.isPressed.toggle() }) {
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
            ZStack(alignment: .bottomTrailing){
                
                ZStack(alignment: .topLeading){
                    Rectangle()
                        .fill(color)
<<<<<<< HEAD
                        .clipShape(RoundedCustomShape(radius: maxRadius, corners: maxCorners))
                        .clipShape(RoundedCustomShape(radius: minRadius, corners: minCorners))
=======
                        .clipShape(CoursesCustomShape(radius: maxRadius, corners: maxCorners))
                        .clipShape(CoursesCustomShape(radius: minRadius, corners: minCorners))
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                    
                    VStack(alignment: .leading) {
                        
                        Text(title)
                            .font(subTitle)
<<<<<<< HEAD
                            .foregroundStyle(whiteColor)
                        
                        Text(description)
                            .font(bodyText)
                            .foregroundStyle(whiteColor)
=======
                        
                        Text(description)
                            .font(bodyText)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
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
<<<<<<< HEAD
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .animation(.spring, value: isPressed)
            .clipShape(RoundedCustomShape(radius: maxRadius, corners: maxCorners))
            .clipShape(RoundedCustomShape(radius: minRadius, corners: minCorners))
            
            .fullScreenCover(isPresented: $isPressed, content: {
                sheetContent()
            })
            
=======
                    
            }
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .animation(.easeInOut, value: isPressed)
            .clipShape(CoursesCustomShape(radius: maxRadius, corners: maxCorners))
            .clipShape(CoursesCustomShape(radius: minRadius, corners: minCorners))
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
        }
        .buttonStyle(tapBounceButtonStyle())
        
    }
<<<<<<< HEAD
    
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
=======
}

#Preview {
    CoursesView(maxRadius: 30, minRadius: 5, maxCorners: [.topLeft, .bottomRight], minCorners: [.topRight, .bottomLeft],title: "Vocabulary", description: "Expand your word", image: "listening", color: vocabularyColor)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
