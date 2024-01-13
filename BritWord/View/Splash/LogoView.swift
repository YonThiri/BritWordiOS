//
//  LogoView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct LogoView : View {
    
    @Binding var showNextView : Bool
    @State private var isShowLoading : Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .ignoresSafeArea()
            
            LottieView(filename: "splashAnimation")
                .frame(height: 280)
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                        
                        withAnimation(.spring) {
                            isShowLoading = true
                            
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            
                            withAnimation(.spring) {
                                showNextView = true
                            }
                        })//: CHANGE NEXT VIEW
                        
                    })//: SHOW LOADING
                    
                })//: ON APPEAR
        }//: ZSTACK
        .overlay(alignment: .bottom) {
            
            ProgressView()
                .scaleEffect(2.0)
                .opacity(isShowLoading ? 1 : 0)
                .progressViewStyle(.circular)
                .tint(.white)
                .padding(.bottom)
            
        }//: OVERLAY
    }
}


#Preview {
    LogoView(showNextView: .constant(false))
}
