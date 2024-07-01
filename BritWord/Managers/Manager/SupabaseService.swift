//
//  SupabaseService.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 03/06/2024.
//

import Foundation
import Supabase

protocol SupabaseServiceProtocol {
    func fetchPodcasts() async throws -> [PodcastsModel]
    func fetchDifferentWords() async throws -> [DifferentWordModel]
}

class SupabaseService: SupabaseServiceProtocol {
    
    private let client: SupabaseClient

    init(client: SupabaseClient) {
        self.client = client
    }

    func fetchPodcasts() async throws -> [PodcastsModel] {
        
        let response : [PodcastsModel] = try await client
            .from("Podcasts")
            .select()
            .order("createdDate", ascending: false)
            .execute()
            .value
        return response
        
    }

    func fetchDifferentWords() async throws -> [DifferentWordModel] {
        
        let response : [DifferentWordModel] = try await client
            .from("DifferentWords")
            .select()
            .execute()
            .value
        return response
    }
}
