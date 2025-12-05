//
//  HabitListView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import SwiftUI
internal import CoreData

struct HabitListView: View {

    @State private var showAddHabit = false

    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("Habits")
            .toolbar{
                Button {
                    showAddHabit = true
                } label: {
                    Image(systemName: "plus.circle.fill").font(.title2)
                }
                .accessibilityIdentifier("addHabitButton")
            }
            .sheet(isPresented: $showAddHabit) {
                AddHabitView()
            }
        }
    }
}
#Preview {
    HabitListView()
}
