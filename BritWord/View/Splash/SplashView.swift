//
//  ContentView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - PROPERTIES
    @State private var showNextView : Bool = false
    
    var body: some View {
        
        if showNextView {

            //HomeView()
            LoginView()

        }
        else{
            
            LogoView(showNextView: $showNextView)
        }
        
    }
}
#Preview {
    SplashView()
}
