//
//  HomeTitleView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 31/03/2024.
//

import SwiftUI

struct HomeTitleView: View {
    
    var title : String
    
    var body: some View {
        
        HStack {
            
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 5, height: 30)
                .foregroundStyle(Color.accentColor)
            
            Text(title)
                .modifier(HeaderTitleModifier())
        }
    }
}

#Preview {
    HomeTitleView(title: "Exercises")
}
