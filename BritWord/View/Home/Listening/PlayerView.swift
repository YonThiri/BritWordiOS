//
//  PlayerView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 31/03/2024.
//

import SwiftUI

struct PlayerView: View {
    
    // MARK: - PROPERTIES
    @State var value = 10.0
    @Environment(\.dismiss) var dismiss
    
    var pathFromFirebase = "Sounds/Podcasts/"
    var podcasts: [PodcastsModel]
    @Binding var index: Int
    
    @StateObject var audioPlayer = AudioPlayer() // Initialize AudioPlayer
    @State private var currentTime = 0.0
    @State private var sliderValue = 0.0
    private let debouncer = Debouncer(delay: 0.1) // Debouncer for slider updates
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack {
                // Navigation Header
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.down")
                            .renderingMode(.original)
                            .imageScale(.medium)
                            .controlSize(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(blackColor)
                    })
                    .buttonStyle(tapBounceButtonStyle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, topNavigationPadding)//: BUTTON
                
                VStack(spacing: 15) {
                    Spacer()
                    
                    RemoteImageView(imageURL: podcasts[index].image)
                        .frame(width: 250, height: 250)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(podcasts[index].title)
                            .font(AppFont.subtitle)
                            .foregroundStyle(blackColor)
                            .lineLimit(2)
                        
                        Text("\(formatDuration(seconds: audioPlayer.duration)) min")
                            .font(AppFont.body2)
                            .foregroundStyle(grayColor)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 25) {
                        
                        VStack(spacing: 0) {
                            // Slider for audio playback
                            Slider(value: Binding(
                                get: { sliderValue },
                                set: { newValue in
                                    sliderValue = newValue
                                    debouncer.run {
                                        self.audioPlayer.seekToTime(time: newValue)
                                    }
                                }
                            ), in: 0...audioPlayer.duration)
                            .onChange(of: audioPlayer.currentTime) { newValue in
                                currentTime = newValue
                                sliderValue = newValue
                            }
                            
                            // Time labels
                            HStack {
                                Text("\(formatDuration(seconds: audioPlayer.currentTime))")
                                    .font(AppFont.body2)
                                Spacer()
                                Text("\(formatDuration(seconds: audioPlayer.duration))")
                                    .font(AppFont.body2)
                            }
                            .foregroundStyle(grayColor)
                        }

                        // Playback controls
                        HStack(spacing: 25) {
                            Button {
                                if index > 0 {
                                    index -= 1
                                }
                            } label: {
                                Image(.backward)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(phoneticsTextColor)
                            }
                            .buttonStyle(tapBounceButtonStyle())
                            
                            Button {
                                if audioPlayer.isPlaying {
                                    audioPlayer.pause()
                                } else {
                                    audioPlayer.playAudio(soundName: podcasts[index].audio, pathFromFirebase: pathFromFirebase)
                                }
                            } label: {
                                // Use isPlaying to determine which image to show
                                if !audioPlayer.isDownloaded {
                                    ProgressView()
                                        .scaleEffect(1.2)
                                        .progressViewStyle(.circular)
                                        .tint(.accentColor)
                                        .background(
                                            Circle()
                                                .fill(Color.phonetics)
                                                .frame(width: 60, height: 60)
                                        )
                                        .frame(width: 80, height: 80)
                                } else {
                                    Image(audioPlayer.isPlaying ? "pauseBtn" : "playBtn")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                }
                            }
                            .buttonStyle(tapBounceButtonStyle())
                            
                            Button {
                                if index < podcasts.count - 1 {
                                    index += 1
                                }
                            } label: {
                                Image(.forward)
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(phoneticsTextColor)
                            }
                            .buttonStyle(tapBounceButtonStyle())
                        }
                        
                    }
                    .frame(height: 250)
                    
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        .onAppear {
            fetchDataAndUpdateView() // Fetch data when view appears
        }
        .onChange(of: index) { newValue in
            fetchDataAndUpdateView() // Fetch data when index changes
        }
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
            audioPlayer.updateProgress()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // Fetch Data and Update View
    func fetchDataAndUpdateView() {
        audioPlayer.isDownloaded = false
        audioPlayer.playAudio(soundName: podcasts[index].audio, pathFromFirebase: pathFromFirebase)
    }
}

// Debouncer class to throttle updates
class Debouncer {
    private let delay: TimeInterval
    private var timer: Timer?
    
    init(delay: TimeInterval) {
        self.delay = delay
    }
    
    func run(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            action()
        }
    }
}

#Preview {
    PlayerView(podcasts: [], index: .constant(0))
}
