//
//  HabitViewModel.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import Foundation
import Combine

class HabitViewModel: ObservableObject {

    @Published var habits: [Habit] = []

    private let service: HabitServiceProtocol

    init(service: HabitServiceProtocol) {
        self.service = service
    }

    func loadHabits() {
        habits = service.fetchHabits()
    }

    func createHabit(title: String) {
        service.createHabit(title: title)
        loadHabits()
    }

    func updateHabit(_ habit: Habit, newTitle: String) {
        service.updateHabit(habit, newTitle: newTitle)
        loadHabits()
    }

    func deleteHabit(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let habit = habits[index]
        service.deleteHabit(habit)
        loadHabits()
    }
}
