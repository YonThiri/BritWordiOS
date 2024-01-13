//
//  ResultSheetView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct ResultSheetView: View {
    
    var body: some View {
        ZStack {
            whiteColor
            
            VStack {
                
                HStack {
                    
                    Image("result_correct")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("Correct")
                        .font(subTitle)
                        .foregroundStyle(correctColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    print("Next")
                    
                }, label: {
                    ButtonView(
                        color: correctColor,
                        buttonTitle: "Next")
                })
                .buttonStyle(tapBounceButtonStyle())
                
            }
            .padding(.horizontal, 20)
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ResultSheetView()
}
