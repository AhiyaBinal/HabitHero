//
//  RoundedInputStyle.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-22.
//

import SwiftUI

struct RoundedInputStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, Constants.styleValue)
            .padding(.vertical, Constants.styleValue)
            .background(Color.gray.opacity(Constants.opacityValue))
            .cornerRadius(Constants.styleValue)
    }
}

extension View {
    func roundedInputStyle() -> some View {
        modifier(RoundedInputStyle())
    }
}

