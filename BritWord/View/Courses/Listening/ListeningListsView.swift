//
//  ListeningListsView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 09/01/2024.
//

import SwiftUI

struct ListeningListsView: View {
<<<<<<< HEAD
    
    // MARK: - PROPERTIES
    @State private var listeningShowSheet : Bool = false
    
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    var body: some View {
        
        ZStack {
            backgroundColor
            
            VStack {
                
<<<<<<< HEAD
                // MARK: - HEADER
                NavigationHeaderView(title: "Listening", description: "\"Listen keenly, let English weave its story in your ears, a tale that unfolds fluency with every word absorbed.\"", backgroundImage: "listening_bg")
                
                // MARK: - LISTENING LIST
=======
                NavigationHeaderView(title: "Listening", description: "\"Listen keenly, let English weave its story in your ears, a tale that unfolds fluency with every word absorbed.\"", backgroundImage: "listening_bg")
                
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                List {
                    
                    ForEach(0..<20, id: \.self) { item in
                        
                            ListeningItemView()
                            .listRowBackground(backgroundColor)
                            .listRowSeparator(.hidden)
<<<<<<< HEAD
                            .onTapGesture {
                                listeningShowSheet = true
                            }
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                    }
                    
                }
                .listStyle(PlainListStyle())
<<<<<<< HEAD
                .fullScreenCover(isPresented: $listeningShowSheet, content: {
                    ListeningDetailView()
                })
            }
        }
        .ignoresSafeArea()
=======
            }
        }
        .ignoresSafeArea()
        
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
    ListeningListsView()
}
