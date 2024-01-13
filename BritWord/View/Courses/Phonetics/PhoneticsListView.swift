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

    @State private var phoneticsDetailSheet : Bool = false


    
    var body: some View {
        
        VStack(spacing: 15) {
            
            // MARK: - TITLE
            Text(title)
                .font(subTitle)

                .foregroundStyle(whiteColor)


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

                            .onTapGesture {
                                phoneticsDetailSheet.toggle()
                            }


                        
                    }//: LOOP
                    
                
            })//: LAZY GRID

            .fullScreenCover(isPresented: $phoneticsDetailSheet, content: {
                PhoneticsDetailview()
            })


        }
    }
}

#Preview {
    PhoneticsListView(title: "Vowels")
}
