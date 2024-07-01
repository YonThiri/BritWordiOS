//
//  ChapterListViewModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 31/03/2024.
//

import Foundation
import SwiftUI

class PodcastsViewModel: ObservableObject {
    
    //MARK: - PROPERTIES
    @Published var podcasts: [PodcastsModel] = []
    @Published var error: Error?
    @Published var newReleased: [PodcastsModel] = []
    @Published var isShowLoading : Bool = false
    
    private let supabaseService: SupabaseServiceProtocol

    init(supabaseService: SupabaseServiceProtocol) {
        self.supabaseService = supabaseService
    }

    func fetchPodcasts() async throws {
        
        do {
            
            DispatchQueue.main.async { [weak self] in
                
                guard let self = self else { return }
                
                isShowLoading = true
                
            }
            
            let fetchedPodcasts = try await supabaseService.fetchPodcasts()
            DispatchQueue.main.async { [weak self] in
                
                guard let self = self else { return }
                
                self.podcasts = fetchedPodcasts
                
                if self.podcasts.count > 5 {
                    self.newReleased = Array(self.podcasts.prefix(5))
                } else {
                    self.newReleased = self.podcasts
                }
                
                isShowLoading = false
                
            }
        }
        
        catch(let error) {
            print("DEBUG: ERROR \(error.localizedDescription)")
            
            DispatchQueue.main.async { [weak self] in
            
                guard let self = self else { return }
                self.error = error
            }
        }
        
    }
}
