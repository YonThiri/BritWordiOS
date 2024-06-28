//
//  ChapterItemView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/04/01/2024.
//

import SwiftUI

struct TrackItemView: View {
    
    // MARK: - PROPERTIES
    var podcasts : [PodcastsModel]
    
    var imageURL : String
    var title : String
    var sound : String
    var duration : String
    
    var body: some View {
        
        ZStack{
            
            HStack(alignment: .center, spacing: 20) {
                
                // MARK: - WORD IMAGE
                RemoteImageView(imageURL: imageURL)
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(title)
                        .font(AppFont.body2).bold()
                        .foregroundStyle(blackColor)
                        .lineLimit(2)
                    
                    Text(duration)
                        .font(AppFont.footnote)
                        .foregroundStyle(grayColor)
                }
                Spacer()
                
            }
            //: CHAPTER TITLE AND IMAGE
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.black.opacity(0.001))
        }
    }
}

#Preview {
    TrackItemView(podcasts: [], imageURL: "", title: "", sound: "", duration: "")
    
}
