//
//  Modifiers.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

struct ShadowViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: neumorphismLightColor, radius: 6, x: -6, y: -6)
            .shadow(color: neumorphismDarkColor, radius: 6, x: 6, y: 6)
    }
}

struct HeaderTitleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(subTitle)
            .foregroundStyle(.accent)
    }
}

struct tapBounceButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .scaleEffect(configuration.isPressed ? 0.9 : 1)
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
