//
//  DailyStreakSettings.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 31/05/2024.
//

import SwiftUI

//class DailyStreakSettings: ObservableObject {
//    @AppStorage("streakDate") var dailyStreak: String = ""
//    @AppStorage("dailyStreakCount") var dailyStreakCount: Int = 0
//    @AppStorage("isStartDay") var isStartDay: Bool = false
//}

import SwiftUI



class NewDayChecker: ObservableObject {
    @AppStorage("lastOpenDate") private var lastOpenDate: Double = 0
    @AppStorage("dailyStreakCount") var dailyStreakCount: Int = 0
    @AppStorage("isStartDay") var isStartDay: Bool = false

    func checkConditions(onNewDay: @escaping (String) -> Void, onSameDay: @escaping (String) -> Void, onDifferentDay: @escaping (String) -> Void) {
        let currentDate = Date()
        let calendar = Calendar.current

        if lastOpenDate != 0 {
            let lastOpenDay = Date(timeIntervalSince1970: lastOpenDate)
            
            if calendar.isDateInToday(lastOpenDay) {
                // The last open date is today
                onSameDay("App opened on the same day. Last open date: \(lastOpenDay), Current date: \(currentDate)")
            } else {
                let isDifferentDay = !calendar.isDate(currentDate, inSameDayAs: lastOpenDay)
                if isDifferentDay {
                    let components = calendar.dateComponents([.day], from: lastOpenDay, to: currentDate)
                    if let dayDifference = components.day, dayDifference == 1 {
                        // It's a new day (since last open date is not today and the difference is exactly one day)
                        dailyStreakCount += 1
                        onNewDay("A new day has been detected. Last open date: \(lastOpenDay), Current date: \(currentDate). Daily streak count: \(dailyStreakCount)")
                    } else {
                        // More than one day has passed since the app was last opened
                        dailyStreakCount = 1
                        onDifferentDay("More than one day difference detected. Last open date: \(lastOpenDay), Current date: \(currentDate). Daily streak count reset to \(dailyStreakCount).")
                    }
                }
            }
        } else {
            // This is the first time the app is opened
            dailyStreakCount = 1 // Start the streak count at 1
            onNewDay("This is the first time the app is opened. Current date: \(currentDate). Daily streak count: \(dailyStreakCount)")
        }

        // Update the last open date to the current date
        lastOpenDate = calendar.startOfDay(for: currentDate).timeIntervalSince1970
    }
}


enum DayChecker : String, CaseIterable {
    
    case newDay
    case sameDay
}
