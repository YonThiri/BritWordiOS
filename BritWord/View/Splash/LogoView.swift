//
//  LogoView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI
import Lottie

struct LogoView : View {
    
    @Binding var showNextView : Bool
    @State private var isShowLoading : Bool = false
    
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            
            LottieView(animation: .named("splashAnimation"))
                .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
            
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

            Group {

                LottieView(animation: .named("loadingWhite"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .resizable()
                    .frame(height: 150, alignment: .bottom)
                    .opacity(isShowLoading ? 1 : 0)
            }
        }//: OVERLAY
    }
}


#Preview {
    LogoView(showNextView: .constant(false))
}
