//
//  ResultSheetView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

struct ResultSheetView: View {
    
    var icon : String
    var text : String
    var textColor : Color
    
    @Binding var progress : Int
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            whiteColor
            
            VStack {
                
                // ICON AND RESULT TEXT
                HStack {
                    
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text(text)
                        .font(subTitle)
                        .foregroundStyle(textColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // NEXT BUTTON
                Button(action: {
                    dismiss()
                    
                    withAnimation(Animation.spring) {
                        progress += 1
                    }
                    
                }, label: {
                    ButtonView(
                        color: textColor,
                        buttonTitle: "Next")
                })
                .buttonStyle(tapBounceButtonStyle())
                
            }//: VSTACK
            .padding(.horizontal, 20)
            
            
        }//: ZSTACK
        .ignoresSafeArea()
    }
}

#Preview {
    ResultSheetView(icon: "result_correct", text: "Correct", textColor: correctColor, progress: .constant(1))
}
