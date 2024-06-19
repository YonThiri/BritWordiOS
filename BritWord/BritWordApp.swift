//
//  BritWordApp.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI
import FirebaseCore

@main
struct BritWordApp: App {
    
    let diContainer = DIContainer()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(diContainer)
        }
    }
}
