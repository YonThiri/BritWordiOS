//
//  RemoteImageView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 07/02/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct RemoteImageView: View {
    
    // MARK: - PROPERTIES
    var imageURL : String
    
    var body: some View {
        WebImage(url: URL(string: imageURL))
            .onSuccess { image, data, cacheType in }
            .resizable()
            .placeholder {
                ProgressView()
                    .tint(.accent)
            }
            .indicator(.activity) // Activity Indicator
            .transition(.fade(duration: 0.5)) // Fade Transition with duration
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .frame(height: 200, alignment: .center)
    }
}

#Preview {
    
    RemoteImageView(imageURL: "")
    
}
