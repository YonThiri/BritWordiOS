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
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        
        Button(action: { self.isPressed.toggle() }) {
            ZStack(alignment: .bottomTrailing){
                
                ZStack(alignment: .topLeading){
                    Rectangle()
                        .fill(color)
                        .clipShape(CoursesCustomShape(radius: maxRadius, corners: maxCorners))
                        .clipShape(CoursesCustomShape(radius: minRadius, corners: minCorners))
                    
                    VStack(alignment: .leading) {
                        
                        Text(title)
                            .font(subTitle)
                        
                        Text(description)
                            .font(bodyText)
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
            .animation(.easeInOut, value: isPressed)
            .clipShape(CoursesCustomShape(radius: maxRadius, corners: maxCorners))
            .clipShape(CoursesCustomShape(radius: minRadius, corners: minCorners))
        }
        .buttonStyle(tapBounceButtonStyle())
        
    }
}

#Preview {
    CoursesView(maxRadius: 30, minRadius: 5, maxCorners: [.topLeft, .bottomRight], minCorners: [.topRight, .bottomLeft],title: "Vocabulary", description: "Expand your word", image: "listening", color: vocabularyColor)
}
