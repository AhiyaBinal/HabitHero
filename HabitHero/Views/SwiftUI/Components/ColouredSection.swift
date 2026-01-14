//
//  ColouredSection.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-10.
//

import SwiftUI

struct ColoredSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    init(title: String,
         color: Color = .clear,
         @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.bodyTitle)
                    .foregroundColor(Color.primaryFontColor)
                content
            }
        }
        .listSectionSpacing(.compact)
    }
}

