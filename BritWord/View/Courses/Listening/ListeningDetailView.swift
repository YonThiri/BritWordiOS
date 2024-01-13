//
//  ListeningDetailView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct ListeningDetailView: View {
<<<<<<< HEAD
    
    // MARK: - PROPERTIES
    @State private var progress: Double = 0
    
    var body: some View {
        
        ZStack {
            backgroundColor
            
            VStack {
                
                SimpleNavigationHeaderView(color: listeningColor)
                    
                
                // MARK: - PLAYER AND CONTENT
                ScrollView {
                    
                    VStack(alignment: .center) {
                        Image("placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Text("Enola Holmes")
                            .font(subTitle)
                            .foregroundStyle(blackColor)
                        
                        // MARK: - SOUND PLAYER
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(listeningColor)
                                .frame(height: 50)
                            
                            HStack {
                                
                                Button {
                                    
                                } label: {
                                    Image("play")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }
                                .buttonStyle(tapBounceButtonStyle())
                                
                                
                                Slider(value: $progress, in: 0.0...1.0)
                                    .tint(vocabularyColor)
                                
                                
                            }
                            .padding(.horizontal, 20)
                            
                        }//: SOUND PLAYER
                        
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ")
                            .font(bodyText)
                            .lineSpacing(15)
                            .foregroundStyle(blackColor)
                    }
                    
                    Spacer()
                    
                }
                .scrollIndicators(.hidden)
            }
            .padding()
        }
        
        .ignoresSafeArea()
        
=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
    ListeningDetailView()
}
