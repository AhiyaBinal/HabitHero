//
//  HabitService.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import Foundation
internal import CoreData

protocol HabitServiceProtocol {
     func createHabit(title: String)
     func fetchHabits() -> [Habit]
     func updateHabit(_ habit: Habit, newTitle: String)
     func deleteHabit(_ habit: Habit)
}

final class HabitService: HabitServiceProtocol {
    
    private let context = CoreDataManager.shared.context

    func createHabit(title: String) {
        let habit = Habit(context: context)
        habit.id = UUID()
        habit.timestamp = Date()
        habit.title = title

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

    func updateHabit(_ habit: Habit, newTitle: String) {
        habit.title = newTitle
        CoreDataManager.shared.save()
    }

    func deleteHabit(_ habit: Habit) {
        context.delete(habit)
        CoreDataManager.shared.save()
    }
}
