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
    @Published var form = HabitModel()
    @Published var activeAlert: AlertScene?
    @Published var didAttemptSave = false
    @Published var didSaveSuccessfully = false

    var hasHabitTitle: Bool {
        !form.habitTitle.isEmpty
    }
    var isDateRangeValid: Bool {
        form.endDate >= form.startDate
    }
    var isStartDateValid: Bool {
        form.startDate >= Calendar.current.startOfDay(for: Date())
    }
    var isHabitDurationSectionValid: Bool {
        isDateRangeValid && isStartDateValid
    }
    var isTaskDaysValid: Bool {
        form.isEveryDay || !form.taskDays.isEmpty

    }

    var firstValidationError: AlertScene? {
           if !hasHabitTitle {
               return .missingTitle
           }
            if form.startDate < Calendar.current.startOfDay(for: Date()) {
                return .invalidDates
            }
            if form.endDate < form.startDate {
                return .invalidDates
            }
            if !isTaskDaysValid {
                return .noTaskDays
            }
//           if !hasSelectedTaskDays {
//               return .noTaskDays
//           }
           return nil
       }
    var showValidationAlert = false
    private let service: HabitServiceProtocol

    init(service: HabitServiceProtocol) {
        self.service = service
    }

    func loadHabits() {
        habits = service.fetchHabits()
    }

    func createHabit(from form: HabitModel) {
        didAttemptSave = true
        if let alert = firstValidationError {
            activeAlert = alert
            return
        }
           service.createHabit(from: form)
           loadHabits()
           didSaveSuccessfully = true
           activeAlert = nil
       }

    func deleteHabit(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let habit = habits[index]
        service.deleteHabit(habit)
        loadHabits()
    }
    
    func setEveryday(_ value: Bool) {
        form.isEveryDay = value
        if value {
            form.taskDays.removeAll()
        }
    }
}


