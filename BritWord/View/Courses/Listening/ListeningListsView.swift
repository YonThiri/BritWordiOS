//
//  ListeningListsView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 09/01/2024.
//

import SwiftUI

struct ListeningListsView: View {
    var body: some View {
        
        ZStack {
            backgroundColor
            
            VStack {
                
                NavigationHeaderView(title: "Listening", description: "\"Listen keenly, let English weave its story in your ears, a tale that unfolds fluency with every word absorbed.\"", backgroundImage: "listening_bg")
                
                List {
                    
                    ForEach(0..<20, id: \.self) { item in
                        
                            ListeningItemView()
                            .listRowBackground(backgroundColor)
                            .listRowSeparator(.hidden)
                    }
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ListeningListsView()
}
