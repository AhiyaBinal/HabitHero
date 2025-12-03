//
//  ContentView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-11-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MyUIKitViewControllerRepresentable()
                .frame(height: 300)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
