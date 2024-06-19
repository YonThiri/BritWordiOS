//
//  NavigationHeaderView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/04/01/2024.
//

import SwiftUI

struct NavigationHeaderView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        

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
                        .foregroundStyle(blackColor)
                })
                .buttonStyle(tapBounceButtonStyle())
                
            }//: BUTTON
            
            .padding(.top, topNavigationPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
        }//: HEADER
        .padding(.all, 20)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    NavigationHeaderView()
}
