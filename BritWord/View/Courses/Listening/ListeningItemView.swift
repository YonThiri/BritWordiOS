//
//  ListeningItemView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 09/01/2024.
//

import SwiftUI

struct ListeningItemView: View {
    var body: some View {
        HStack {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text("Enola Holmes")
                .font(descriptionText)
                .foregroundStyle(listeningTextColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 120)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(whiteColor)
        )
    }
}

#Preview {
    ListeningItemView()
}
