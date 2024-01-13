//
//  CoursesLeftCustomShape.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct RoundedCustomShape: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

       func path(in rect: CGRect) -> Path {
           let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           return Path(path.cgPath)
       }
}

#Preview {
    RoundedCustomShape()
}
