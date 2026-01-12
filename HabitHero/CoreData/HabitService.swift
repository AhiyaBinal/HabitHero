//
//  HabitService.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import Foundation
internal import CoreData

protocol HabitServiceProtocol {
     func createHabit(from form: HabitModel)
     func fetchHabits() -> [Habit]
     func deleteHabit(_ habit: Habit)
}

final class HabitService: HabitServiceProtocol {
    
    private let context = CoreDataManager.shared.context

    func createHabit(from form: HabitModel) {
        let habit = Habit(context: context)
        habit.id = UUID()
        habit.timestamp = Date()
        habit.habitTitle = form.habitTitle
        habit.habitDescription = form.habitDescription
        habit.habitType = form.habitType.rawValue
        habit.startDate = form.startDate
        habit.endDate = form.endDate
        habit.isEveryday = form.isEveryDay
        habit.taskDays = form.selectedDaysText
        habit.timeRange = form.timeRange.rawValue
        habit.goalUnit = form.goalUnit.rawValue
        CoreDataManager.shared.save()
    }

    func fetchHabits() -> [Habit] {
        let request: NSFetchRequest<Habit> = Habit.fetchRequest()

        let sort = NSSortDescriptor(key: "timestamp", ascending: false)
        request.sortDescriptors = [sort]

        do {
            return try context.fetch(request)
        } catch {
            print("Fetch error: \(error.localizedDescription)")
            return []
        }
    }

    func deleteHabit(_ habit: Habit) {
        context.delete(habit)
        CoreDataManager.shared.save()
    }
}
