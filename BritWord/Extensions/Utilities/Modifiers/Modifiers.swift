//
//  Modifiers.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct HeaderTitleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(AppFont.subtitle)
            .foregroundStyle(blackColor)
    }
}

struct TapBounceButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
          .scaleEffect(configuration.isPressed ? 0.9 : 1)
          .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: configuration.isPressed)
  
  }
}

struct CustomProgressViewStyle: ProgressViewStyle {
    
  var progressColor: Color

  func makeBody(configuration: Configuration) -> some View {
      ProgressView(configuration)
          .accentColor(progressColor)
          .frame(height: 18.0) // Manipulate height, y scale effect and corner radius to achieve your needed results
          .scaleEffect(x: 1, y: 2, anchor: .center)
          
  }
}
