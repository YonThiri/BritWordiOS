//
//  DifferentWordsRowView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 06/02/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct DifferentWordsRowView: View {
    
    // MARK: - PROPERTIES
    var differentWord : DifferentWordModel
    private let pathFromFirebase: String = "Sounds/DifferentWords/"
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            // BACKGROUND
            RoundedRectangle(cornerRadius: 15)
                .fill(whiteColor)
            
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - WORD IMAGE
                RemoteImageView(imageURL: differentWord.imageURL)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200, alignment: .center)
                
                // MARK: - AMERICAN WORD
                DifferentWordTextView(
                    meaning: differentWord.us,
                    iconName: "american",
                    soundName: differentWord.usSoundURL,
                    pathFromFirebase: pathFromFirebase)
                
                // MARK: - BRITISH WORD
                DifferentWordTextView(
                    meaning: differentWord.uk,
                    iconName: "british",
                    soundName: differentWord.ukSoundURL,
                    pathFromFirebase: pathFromFirebase)
                
            }//: IMAGE & TEXTS
            .padding(20)
        }
    }
}

#Preview {
    DifferentWordsRowView(differentWord: DifferentWordModel(id: 1, us: "chip", uk: "chips", imageURL: "", ukSoundURL: "", usSoundURL: ""))
}


