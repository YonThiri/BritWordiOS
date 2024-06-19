//
//  NavigationBarModifier.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 22/05/2024.
//

import Foundation
import SwiftUI

// Change Navigation Bar Background Color And Title Color
struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        //coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.font: UIFont(name: "Poppins-Bold", size: 20)!,.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.font: UIFont(name: "Poppins-Bold", size: 34)!,.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {

    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}
