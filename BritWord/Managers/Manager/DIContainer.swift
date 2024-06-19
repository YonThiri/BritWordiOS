//
//  DIContainer.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 03/06/2024.
//

import Foundation
import Supabase

class DIContainer: ObservableObject {
    let supabaseService: SupabaseServiceProtocol

    init() {
        let client = SupabaseClient(supabaseURL: Constants.supabaseUrl, supabaseKey: Constants.supabaseKey)
        self.supabaseService = SupabaseService(client: client)
    }
}
