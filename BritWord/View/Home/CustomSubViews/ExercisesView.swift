//
//  ExercisesView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/03/2024.
//

import SwiftUI

struct ExercisesView: View {
    
    // MARK: - Properties
    var title: String
    var description: String
    var image: String
    var color: Color
    var destinationSheet: HomeExercisesDestination
    
    @State private var isPressed: Bool = false
    @State private var sheetType: HomeExercisesDestination?
    
    var body: some View {
        Button(action: {
            
            // MARK: - COMING SOON
            self.isPressed.toggle()
            sheetType = destinationSheet
        }) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                
                switch destinationSheet {
                case .test:
                    contentStack(imageAlignment: .leading)
                case .quiz:
                    contentStack(imageAlignment: .trailing)
                case .flashCard:
                    contentStack(imageAlignment: .leading)
                }
            }
            .animation(.spring, value: isPressed)
            .frame(height: 160)
            .fullScreenCover(isPresented: $isPressed, content: sheetContent)
        }
        .buttonStyle(tapBounceButtonStyle())
    }
    
    @ViewBuilder
    private func contentStack(imageAlignment: Alignment) -> some View {
        HStack(alignment: .center, spacing: 15) {
            if imageAlignment == .leading {
                imageView()
                textStack()
            } else {
                textStack()
                imageView()
            }
        }
        .padding(.horizontal, 15)
    }
    
    private func imageView() -> some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
    
    private func textStack() -> some View {
        VStack(alignment: .center) {
            Text(title)
                .font(title1)
                .foregroundStyle(whiteColor)
            Text(description)
                .font(bodyText)
                .foregroundStyle(secondaryTextColor)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
    private func sheetContent() -> some View {
        if let type = sheetType {
            switch type {
            case .test, .quiz, .flashCard:
                return TestStartView()
            }
        }
        fatalError("Sheet type is nil.")
    }
}


#Preview {
    ExercisesView(title: "Test", description: "Quick English vocab test ahead!", image: "phonetics", color: testColor, destinationSheet: .quiz)
}
