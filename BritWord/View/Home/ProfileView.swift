//
//  ProfileView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 05/01/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome")
                    .font(bodyText)
                    .foregroundStyle(grayColor)
                
                
                Text("John Doe")
                    .font(headerTitle)
                    .foregroundStyle(.accent)
            }
            
            Spacer()
            
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    ProfileView()
}
