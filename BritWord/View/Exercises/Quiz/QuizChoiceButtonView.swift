//
//  QuizChoiceButtonView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/01/2024.
//

import SwiftUI

struct QuizChoiceButtonView: View {
    
    @State private var resultSheetShow : Bool = false
    
    var body: some View {
        
        Button(action: {
            
            resultSheetShow = true
            
        }, label: {
            Text("A")
                .font(subTitle)
                .foregroundStyle(grayColor)
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(
                    Capsule()
                        .fill(quizBgColor)
                )
        })
        .buttonStyle(tapBounceButtonStyle())
        .sheet(isPresented: $resultSheetShow, content: {
            ResultSheetView()
                .presentationDetents([.height(150)])
                
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    QuizChoiceButtonView()
}
