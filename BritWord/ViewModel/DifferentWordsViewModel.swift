//
//  DifferentWordsViewModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 07/02/2024.
//

import Foundation
import Supabase

@MainActor
final class DifferentWordsViewModel : ObservableObject {
    
    @Published var differentWordLists = [DifferentWordModel]()
    
    let supabase = SupabaseClient(supabaseURL: Keys.projectURL, supabaseKey: Keys.apiKey)

    // MARK: - Database
    func fetchDifferentWords() async throws {
        
        let differentWords : [DifferentWordModel] = try await supabase.database
            .from(Table.differentWords)
            .select()
            .order("id")
            .execute()
            .value
        DispatchQueue.main.async {
            self.differentWordLists = differentWords
            print("Different \(differentWords)")
        }
    }
    
}
