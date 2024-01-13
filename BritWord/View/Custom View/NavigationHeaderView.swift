//
//  NavigationHeaderView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 08/01/2024.
//

import SwiftUI

struct NavigationHeaderView: View {
    
    // MARK: - PROPERTIES
    var title : String
    var description : String
    var backgroundImage : String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack(spacing: 15){
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .renderingMode(.original)
                        .imageScale(.medium)
                        .controlSize(.large)
                        .fontWeight(.bold)
<<<<<<< HEAD
                        .foregroundStyle(whiteColor)
                })
                .buttonStyle(tapBounceButtonStyle())
=======
                        .tint(whiteColor)
                })
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                
                Text(title)
                    .font(headerTitle)
                    .foregroundStyle(whiteColor)
            }//: BUTTON
            
            .padding(.top, 40)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text(description)
                .font(bodyText)
                .foregroundStyle(whiteColor)
                
            
        }//: HEADER
        .padding(.all, 20)
        .frame(maxWidth: .infinity)
        .background(
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
        )
    }
}

#Preview {
    NavigationHeaderView(title: "American Vs British", description: "Two Style", backgroundImage: "different_bg")
}
