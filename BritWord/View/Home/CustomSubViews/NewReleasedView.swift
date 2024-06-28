//
//  NewReleasedView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 24/05/2024.
//

import SwiftUI

struct NewReleasedView: View {
    
    var title : String
    var imageURL : String
    var createdDate : String
    
    
    var body: some View {
                    
        ZStack(alignment: .leading) {
            Image(.playlistBg)
                .resizable()
                .frame(height: 180)
            
            VStack(alignment: .leading, spacing: 10) {
                RemoteImageView(imageURL: imageURL)
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("\(title)")
                            .font(AppFont.body2).bold()
                            .lineLimit(2)
                            .foregroundStyle(blackColor)
                        
                        if let formattedDate = DateFormatter.formattedDate(from: createdDate, with: "dd MMMM yyyy") {
                            Text(formattedDate)
                                .font(AppFont.footnote2)
                                .foregroundStyle(grayColor)
                        } else {
                            Text("Invalid date")
                                .font(AppFont.footnote2)
                                .foregroundStyle(.red)
                        }
                    }
                    
                }
                
                
            }
            .padding()
            
        }
        .frame(width: 280)//: NEW RELEASED
        .padding(.leading, objectTopPadding)
                
    }
}


#Preview {
    NewReleasedView(title: "", imageURL: "", createdDate: "")
}
