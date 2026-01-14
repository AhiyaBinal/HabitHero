//
//  ContentView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-11-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack { HabitListView() }
                .tabItem { Label(Constants.home, systemImage: Constants.homeImage)
            }
            NavigationStack { HabitListView() }
            .tabItem { Label("Report", systemImage: "chart.bar.fill") }
        }
           // MyUIKitViewControllerRepresentable()
             //   .frame(height: 300)
    }
}

#Preview {
    ContentView()
}
