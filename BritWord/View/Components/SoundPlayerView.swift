//
//  SoundPlayerView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 14/04/01/2024.
//

import SwiftUI

struct SoundPlayerView: View {
    
    // MARK: - PROPERTIES
    var color : Color

    @State private var progress : Double = 0.5
    var soundName : String
    var pathFromFirebase : String
    @ObservedObject var audioPlayer: AudioPlayer
    
    var body: some View {
        
        // MARK: - SOUND PLAYER
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(color)
                .frame(height: 50)
            
            HStack {
                
                if (!audioPlayer.isDownloaded) {
                    ProgressView()
                        .tint(.accent)
                        .isHidden(audioPlayer.isDownloaded)
                }
                else{
                    Button {
                        
                        if audioPlayer.isPlaying {
                            audioPlayer.pause()
                        }
                        else{
                            audioPlayer.playAudio(soundName: "\(soundName).mp3", pathFromFirebase: pathFromFirebase)
                        }
                        
                    } label: {
                        
                        // Use isPlaying to determine which image to show
                        Image(audioPlayer.isPlaying ? "pause" : "play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .buttonStyle(TapBounceButtonStyle())
                }
                
            }
            .padding(.horizontal, 20)
            
        }//: SOUND PLAYER
    }
}

#Preview {
    SoundPlayerView(color: phoneticsColor, soundName: "", pathFromFirebase: "/Sounds/Tests/", audioPlayer: .init())
}
