//
//  SelectedRowStyle.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-22.
//

import SwiftUI

struct SelectedRowStyle: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if isSelected {
                Image(systemName: Constants.checkmarkImage)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
    }
}

