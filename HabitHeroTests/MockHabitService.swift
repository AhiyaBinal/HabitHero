//
//  MockHabitService.swift
//  HabitHeroTests
//
//  Created by Binal Manek on 2025-12-02.
//

import Testing

@testable import HabitHero

final class MockHabitService: HabitServiceProtocol {

    // MARK: - Tracking Calls

    private(set) var didCreateHabit = false
    private(set) var didFetchHabits = false
    private(set) var didDeleteHabit = false

    private(set) var createdHabitForm: HabitModel?
    private(set) var deletedHabit: Habit?

    var stubbedHabits: [Habit] = []

    // MARK: - Protocol Methods

    func createHabit(from form: HabitModel) {
        didCreateHabit = true
        createdHabitForm = form
    }

    func fetchHabits() -> [Habit] {
        didFetchHabits = true
        return stubbedHabits
    }

    func deleteHabit(_ habit: Habit) {
        didDeleteHabit = true
        deletedHabit = habit
    }
}

