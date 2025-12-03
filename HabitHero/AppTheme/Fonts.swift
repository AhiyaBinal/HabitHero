//
//  Fonts.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import Foundation
import SwiftUI

enum AppFont {
    static func title(_ size: CGFloat = 20) -> Font {
        Font.system(size: size, weight: .bold)
    }
    static func body(_ size: CGFloat = 16) -> Font {
        Font.system(size: size, weight: .regular)
    }
}
