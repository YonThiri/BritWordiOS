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
            .resizable()
            .indicator(.activity)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0.0, y: 5.0)
    }
}

#Preview {
    
    RemoteImageView(imageURL: "")
    
}
