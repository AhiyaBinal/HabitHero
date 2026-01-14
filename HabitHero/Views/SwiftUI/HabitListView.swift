//
//  HabitListView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import SwiftUI
internal import CoreData

struct HabitListView: View {

    @StateObject private var vm = HabitViewModel(service: HabitService())
    @State private var showAddHabit = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.habits, id: \.id) { habit in
                    VStack(alignment: .leading) {
                        Text(habit.habitTitle ?? "")
                            .font(.headline)
                    }
                }
                .onDelete(perform: vm.deleteHabit)
            }
            .navigationTitle(Constants.habitListTitle)
            .navigationDestination(isPresented: $showAddHabit) {
                   AddNewHabitView()
               }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { vm.loadHabits() }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddHabit = true
                    } label: {
                        Image(systemName: Constants.addHabitImage).font(.title2)
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
#Preview {
    HabitListView()
}
