//
//  UINavigationController + Extension.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 22/05/2024.
//

import Foundation
import UIKit

// Swipe Gesture To Go Back Previous Screen For Custom Back Button
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
