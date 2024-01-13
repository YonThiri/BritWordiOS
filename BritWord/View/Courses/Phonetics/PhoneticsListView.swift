//
//  PhoneticsListView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct PhoneticsListView: View {
    
    // MARK: - PROPERTIES
    var title : String
    var columns : [GridItem] = Array(repeating: .init(.flexible(), spacing: 5), count: 5)
<<<<<<< HEAD
    @State private var phoneticsDetailSheet : Bool = false
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            // MARK: - TITLE
            Text(title)
                .font(subTitle)
<<<<<<< HEAD
                .foregroundStyle(whiteColor)
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(phoneticsColor)
                )
                .padding(.top, 20)
            
            // MARK: - ITEMS
            LazyVGrid(columns: columns, content: {
                
                    ForEach(0..<15, id: \.self) { item in
                        
                        Text("i:")
                            .font(subTitle)
                            .foregroundStyle(phoneticsColor)
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(phoneticsBgColor)
                            )
<<<<<<< HEAD
                            .onTapGesture {
                                phoneticsDetailSheet.toggle()
                            }
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
                        
                    }//: LOOP
                    
                
            })//: LAZY GRID
<<<<<<< HEAD
            .fullScreenCover(isPresented: $phoneticsDetailSheet, content: {
                PhoneticsDetailview()
            })
=======
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
        }
    }
}

#Preview {
    PhoneticsListView(title: "Vowels")
}
