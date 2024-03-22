//
//  ProfileView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 05/01/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            
            gradientColor
                .ignoresSafeArea()
                .frame(height: 180)
            
            VStack(alignment: .leading) {
                Text("Explore & Learn!")
                    .font(headerTitle)
                    .foregroundStyle(whiteColor)
                
                Text("Let’s start learning")
                    .font(bodyText)
                    .foregroundStyle(secondaryTextColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, topNavigationPadding)
            .padding(.horizontal, 20)
            
        }
    }
}

#Preview {
    HeaderView()
}
