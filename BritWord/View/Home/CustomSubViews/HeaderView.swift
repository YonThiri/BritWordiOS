//
//  ProfileView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            
            HStack(alignment: .center) {
                Text("Britword")
                    .font(AppFont.header)
                    .foregroundStyle(Color.accentColor)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("chart")
                        .resizable()
                        .frame(width: 25, height: 25)
                }

            }
            .padding(.top, topNavigationPadding)
            .padding(.horizontal, 20)
            
        }
    }
}

#Preview {
    HeaderView()
}
