//
//  NavigationHeaderView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/01/2024.
//

import SwiftUI

struct NavigationHeaderView: View {
    
    // MARK: - PROPERTIES
    var title : String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            gradientColor
                .ignoresSafeArea()
                .frame(height: 130)
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .renderingMode(.original)
                            .imageScale(.medium)
                            .controlSize(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(whiteColor)
                    })
                    .buttonStyle(tapBounceButtonStyle())
                    
                    Text(title)
                        .font(headerTitle)
                        .foregroundStyle(whiteColor)
                }//: BUTTON
                
                .padding(.top, topNavigationPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }//: HEADER
            .padding(.all, 20)
            .frame(maxWidth: .infinity)
        }
        
    }
}

#Preview {
    NavigationHeaderView(title: "American Vs British")
}
