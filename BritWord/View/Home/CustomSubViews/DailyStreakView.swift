//
//  DailyStreakView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 22/05/2024.
//

import SwiftUI

struct DailyStreakView: View {
    
    @StateObject private var dailyStreakSettings = NewDayChecker()
    
    var body: some View {
    
        ZStack {
            Image(.dailyStreakBg)
                .resizable()
                .frame(height: 240)
            
            VStack(spacing: 10) {
                Image(.dailyStreak)
                    .resizable()
                    .frame(width: 40, height: 40)
                
                VStack(spacing: 5) {
                    
                    Text("\(dailyStreakSettings.dailyStreakCount)")
                        .font(AppFont.title2).bold()
                        .foregroundStyle(blackColor)
                    
                    Text("Daily Streak")
                        .font(AppFont.body2).bold()
                        .foregroundStyle(blackColor)
                    
                    Text("You are really doing well.")
                        .font(AppFont.footnote)
                        .foregroundStyle(grayColor)
                }
            }
            
        }//: DAILY STREAK
        
    }
}


#Preview {
    DailyStreakView()
}
