//
//  DailyStreakImageEffect.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 30/05/2024.
//

import SwiftUI

struct DailyStreakImageEffect: View {
    
    @State private var animation : Double = 0.0
    
    var body: some View {
        Image(.dailyStreak)
            .resizable()
            .frame(width: 40, height: 40)
            .padding()
            .background(
                
                ZStack{
                    Circle()
                        .fill(Color.dailyStreakEffect)
                    
                    Circle()
                        .fill(Color.dailyStreakEffect.opacity(0.5))
                        .scaleEffect(1 + CGFloat(animation))
                        .opacity(1 - animation)
                }
            )
            .onAppear(perform: {
                withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                    
                    animation = 1
                }
            })
    }
}


#Preview {
    DailyStreakImageEffect()
}
