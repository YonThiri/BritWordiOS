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
<<<<<<< HEAD
            //HomeView()
            LoginView()
=======
            HomeView()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
        }
        else{
            
            LogoView(showNextView: $showNextView)
        }
        
    }
}
#Preview {
    SplashView()
}
