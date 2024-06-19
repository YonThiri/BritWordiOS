//
//  PodcastInfoView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 02/04/2024.
//

import SwiftUI

struct PodcastInfoView: View {
    
    @Binding var expandSheet : Bool
    var animation : Namespace.ID
    
    var body: some View {
        
        HStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(phoneticsColor)
                .frame(width: 80, height: 80)
        }
        
    }
}

#Preview {
    HomeView()
}
