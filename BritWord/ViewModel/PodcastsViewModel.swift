//
//  ChapterListViewModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 31/03/2024.
//

import Foundation
import SwiftUI

@MainActor
class PodcastsViewModel: ObservableObject {
    @Published var podcasts: [PodcastsModel] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var newReleased: [PodcastsModel] = []
    
    private let supabaseService: SupabaseServiceProtocol

    init(supabaseService: SupabaseServiceProtocol) {
        self.supabaseService = supabaseService
    }

    func fetchPodcasts(){
        isLoading = true

        Task {
            do {
                let fetchedPodcasts = try await supabaseService.fetchPodcasts()
                DispatchQueue.main.async { [self] in
                    self.podcasts = fetchedPodcasts
                    print("Fetch \(self.podcasts)")
                    
                    if self.podcasts.count > 5 {
                        self.newReleased = Array(podcasts.prefix(5))
                    } else {
                        self.newReleased = podcasts
                    }
                    
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
}
