//
//  ContentView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - PROPERTIES
    @State private var showNextView: Bool = false
    @State private var podcasts: [PodcastsModel] = []
    @State private var newReleased: [PodcastsModel] = []
    
    var body: some View {
        if showNextView {
            HomeView(podcasts: podcasts, newReleased: newReleased)
        } else {
            LogoView(showNextView: $showNextView, podcasts: $podcasts, newReleased: $newReleased)
        }
    }
}

#Preview {
    SplashView()
}
