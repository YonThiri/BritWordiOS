//
//  DifferentWordsViewModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 07/02/2024.
//

import Foundation
import Supabase

class DifferentWordsViewModel: ObservableObject {
    @Published var differentWords: [DifferentWordModel] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private let supabaseService: SupabaseServiceProtocol

    init(supabaseService: SupabaseServiceProtocol) {
        self.supabaseService = supabaseService
    }

    func fetchDifferentWords() {
        isLoading = true
        Task {
            do {
                let fetchedDifferentWords = try await supabaseService.fetchDifferentWords()
                DispatchQueue.main.async { [weak self] in
                    // Ensure self is still available
                    guard let self = self else { return }
                    self.differentWords = fetchedDifferentWords
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    // Ensure self is still available
                    guard let self = self else { return }
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
}
