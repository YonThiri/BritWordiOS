//
//  SimpleNavigationHeaderView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct SimpleNavigationHeaderView: View {
<<<<<<< HEAD
    
    // MARK: - PROPERTIES
    var color : Color
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        
        HStack {
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.backward")
                    .renderingMode(.template)
                    .imageScale(.medium)
                    .controlSize(.large)
                    .fontWeight(.bold)
                    .foregroundStyle(color)
            })
            .buttonStyle(tapBounceButtonStyle())
            .padding(.top, 60)
            Spacer()
        }
=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
<<<<<<< HEAD
    SimpleNavigationHeaderView(color: vocabularyColor)
=======
    SimpleNavigationHeaderView()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
