//
//  PhoneticsExampleItemView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 15/03/2024.
//

import SwiftUI

struct PhoneticsExampleItemView: View {
    
    var example : Example
    var index : Int
    
    @State var soundName : String = ""
    private let pathFromFirebase: String = "Sounds/Phonetics/"
    @ObservedObject var audioPlayer: AudioPlayer
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            // Number
            Text("\(index) .")
                
            // Word
            Text("\"\(example.word)\"")
            
            // Phonetic Symbol
            Text("\(example.phoneticsSymbol)")
                .font(bodyText)
            
            Spacer()
            
            ProgressView()
                .tint(.accent)
                .isHidden(audioPlayer.isDownloaded)
            
            // MARK: - SOUND BUTTON
            Button(action: {
                
                audioPlayer.isDownloaded = false
                audioPlayer.playAudio(soundName: "\(example.soundURL).mp3", pathFromFirebase: pathFromFirebase)
                
            }, label: {
                Image("speaker")
                    .renderingMode(.template)
                    .foregroundStyle(phoneticsTextColor)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(phoneticsColor)
                    )
            })
            .buttonStyle(tapBounceButtonStyle())
            
        }
        .font(descriptionText)
        .foregroundStyle(blackColor)
    }
}

#Preview {
    
    PhoneticsExampleItemView(example: vowelPhoneticLists.phoneticsList[0].example[0], index: 1, audioPlayer: .init())
}
