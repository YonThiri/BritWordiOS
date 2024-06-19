//
//  TimeFormat.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 07/04/2024.
//

import Foundation

// MARK: - FORMAT DURATION TIME
func formatDuration(seconds: TimeInterval) -> String {
    let minutes = Int(seconds) / 60
    let remainingSeconds = Int(seconds) % 60
    return String(format: "%d:%02d", minutes, remainingSeconds)
}
