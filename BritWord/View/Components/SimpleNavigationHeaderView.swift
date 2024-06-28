//
//  SimpleNavigationHeaderView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/04/01/2024.
//

import SwiftUI

struct SimpleNavigationHeaderView: View {
    
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
            .buttonStyle(TapBounceButtonStyle())
            .padding(.top, 60)
            Spacer()
        }
    }
}

#Preview {
    SimpleNavigationHeaderView(color: phoneticsColor)
}
