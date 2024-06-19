//
//  Extensions.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 06/02/2024.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
