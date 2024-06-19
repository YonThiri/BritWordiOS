//
//  DateFormatter.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 12/06/2024.
//

import Foundation

extension DateFormatter {
    static func formattedDate(from dateString: String, with format: String) -> String? {
        
        print("Date \(dateString)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = format
        return outputDateFormatter.string(from: date)
    }
}

