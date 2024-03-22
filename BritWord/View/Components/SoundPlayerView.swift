//
//  SoundPlayerView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 14/01/2024.
//

import SwiftUI

struct SoundPlayerView: View {
    
    // MARK: - PROPERTIES
    var color : Color
    var isShowSeekBar : Bool
    
    @State private var progress : Double = 0.5
    
    var body: some View {
        
        // MARK: - SOUND PLAYER
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(color)
                .frame(height: 50)
            
            HStack {
                
                Button {
                    
                } label: {
                    Image("play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                .buttonStyle(tapBounceButtonStyle())
                
                
                Slider(value: $progress, in: 0.0...1.0)
                    .tint(whiteColor)
                    .opacity(isShowSeekBar ? 1 : 0)
                
            }
            .padding(.horizontal, 20)
            
        }//: SOUND PLAYER
    }
}

#Preview {
    SoundPlayerView(color: phoneticsColor, isShowSeekBar: true)
}
