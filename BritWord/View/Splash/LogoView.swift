//
//  LogoView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI
import Lottie

struct LogoView: View {
    
    @Binding var showNextView: Bool
    @Binding var podcasts: [PodcastsModel]
    @Binding var newReleased: [PodcastsModel]
    
    @State private var isShowLoading: Bool = false
    @State private var isAnimateLogo: Bool = false
    @StateObject private var viewModel: PodcastsViewModel = PodcastsViewModel(supabaseService: DIContainer().supabaseService)
    
    var body: some View {
        ZStack {
            whiteColor
                .ignoresSafeArea()
            
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: isAnimateLogo ? 60 : 100)
                .frame(width: 150, height: 150)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(whiteColor)
                        .shadow(color: grayColor.opacity(0.1), radius: 10, x: 0, y: 10)
                        
                )
                .opacity(isAnimateLogo ? 1 : 0)
        }//: ZSTACK
        .task {
            
            // Animate the logo
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring) {
                    isAnimateLogo = true
                }
                
                // Wait for 2 seconds after the logo animation is completed
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isShowLoading = true
                }
            }
            
            guard viewModel.podcasts.isEmpty else { return }
            do {
                try await viewModel.fetchPodcasts()
                withAnimation(.spring) {
                    
                    // Update the binding properties
                    podcasts = viewModel.podcasts
                    newReleased = viewModel.newReleased
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        
                        isShowLoading = viewModel.isShowLoading
                        
                        if !isShowLoading {
                            
                            showNextView = true
                            
                        }
                        
                    }
                }
            } catch {
                // Handle the error
                print("Failed to fetch podcasts: \(error)")
            }
        }
        .overlay(alignment: .bottom) {
            Group {
                LottieView(animation: .named("loading"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .resizable()
                    .frame(height: 150, alignment: .bottom)
                    .opacity(isShowLoading ? 1 : 0)
            }
        }//: OVERLAY
    }
}


//
//
#Preview {
    LogoView(showNextView: .constant(true), podcasts: .constant([]), newReleased: .constant([]))
    
    
}
