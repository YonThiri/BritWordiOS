//
//  DifferentWordTextView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/04/01/2024.
//

import SwiftUI

struct DifferentWordTextView: View {
    
    // MARK: - PROPERTIES
    var meaning : String
    var iconName : String
    var soundName : String
    var pathFromFirebase : String
    @StateObject private var audioPlayer = AudioPlayer()
    
    var body: some View {
        
        HStack {
            
            Button {
             
                audioPlayer.isDownloaded = false
                audioPlayer.playAudio(soundName: "\(soundName).mp3", pathFromFirebase: pathFromFirebase)
                
            } label: {
                HStack {
                    
                    Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Text(meaning)
                        .font(AppFont.subtitle)
                        .foregroundStyle(blackColor)
                    
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(differentColor)
                )
            }
            .buttonStyle(TapBounceButtonStyle())

            ProgressView()
                .tint(.accent)
                .isHidden(audioPlayer.isDownloaded)

        }
        .buttonStyle(TapBounceButtonStyle())
    }
}

#Preview {
    DifferentWordTextView(meaning: "american", iconName: "Chips",soundName: "", pathFromFirebase: "")
}
