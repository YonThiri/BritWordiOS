//
//  DailyStreakAlertView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 30/05/2024.
//

import SwiftUI
import Lottie

struct DailyStreakAlertView: View {
    
    
    @Binding var isStartDay: Bool
    @StateObject private var newDayChecker = NewDayChecker()
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            LottieView(animation: .named("confetti_effect"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 20) {
                
                DailyStreakImageEffect()
                
                Text("Small steps lead to big changes.")
                    .font(AppFont.subtitle)
                    .foregroundStyle(grayColor)
                
                Text("\(newDayChecker.dailyStreakCount) Day Streak!")
                    .font(AppFont.subtitle)
                    .foregroundStyle(blackColor)
                
                Button(action: {
                    isStartDay = false
                }, label: {
                    ButtonView(color: Color.accentColor, buttonTitle: "Got It")
                })
                .buttonStyle(tapBounceButtonStyle())
            }
            .foregroundStyle(blackColor)
        }
        .frame(height: 450)
        .clipShape(.rect(cornerRadius: 25))
        .padding(.horizontal, 15)
    }
}


#Preview {
    DailyStreakAlertView(isStartDay: .constant(true))
}

