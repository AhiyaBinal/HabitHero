//
//  HabitModel.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-08.
//

import Foundation

struct HabitModel: Identifiable {
    var id = UUID()
    var habitTitle: String = ""
    var habitDescription: String = ""
    var habitType : HabitType = .build
    var startDate: Date = Date()
    var endDate: Date = Date()
    var isEveryDay: Bool = true
    var taskDays: [TaskDays] = []
    var timeRange: TimeRange = .anytime
    var goalValue: Int = 0
    var goalUnit: GoalUnit = .count

}
extension HabitModel {
    var selectedDaysText: String {
        if isEveryDay { return Constants.everyDay }
        if taskDays.isEmpty { return Constants.none }
           return taskDays
               .map { $0.shortName }
               .joined(separator: ", ")
       }
}
enum GoalUnit: String, CaseIterable, Identifiable {
    case count = "Count"
    case steps = "Steps"
    case meter = "m"
    case kilometer = "km"
    case mile = "mile"
    case milliliter = "ml"
    case ounce = "oz"
    case calorie = "Cal"
    case gram = "g"
    case milligram = "mg"
    case drink = "drink"
    
    case second = "sec"
    case minute = "min"
    case hour = "hr"
    
    var id: String { rawValue }
    
    static let quantityUnits: [GoalUnit] = [
        .count, .steps, .meter, .kilometer, .mile,
        .milliliter, .ounce, .calorie, .gram, .milligram, .drink
    ]
    
    static let timeUnits: [GoalUnit] = [
        .second, .minute, .hour
    ]
}
enum HabitType: String, CaseIterable {
    case build = "Build"
    case quit = "Quit"
}
enum TimeRange: String, CaseIterable {
    case anytime = "Anytime"
    case morning = "Morning"
    case afternoon = "Afternoon"
    case evening = "Evening"
}
enum TaskDays: String, CaseIterable, Identifiable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    var id: String { rawValue }
    var shortName: String {
        switch self {
        case .monday: return "Mon"
        case .tuesday: return "Tue"
        case .wednesday: return "Wed"
        case .thursday: return "Thu"
        case .friday: return "Fri"
        case .saturday: return "Sat"
        case .sunday: return "Sun"
        }
    }
}
enum ActiveSheet: Identifiable {
    case goalUnit
    case timeUnit
    var id: Int { hashValue }
}
enum UnitTab: String, CaseIterable {
    case quantity = "Quantity"
    case time = "Time"
}
enum AlertScene: Identifiable, Equatable {
    case missingTitle
    case invalidDates
    case noTaskDays
    case saveSuccess

    var id: Int { hashValue }

    var title: String {
        switch self {
        case .missingTitle:
            return "Habit Title Missing"
        case .invalidDates:
            return "Invalid Dates"
        case .noTaskDays:
            return "Select Task Days"
        case .saveSuccess:
            return "Habit Created"
        }
    }

    var message: String {
        switch self {
        case .missingTitle:
            return "Please enter a name for your habit."
        case .invalidDates:
            return "Start date must be today or later and end date cannot be earlier than start date."
        case .noTaskDays:
            return "Please select at least one day for this habit."
        case .saveSuccess:
            return "Your habit has been saved successfully."
        }
    }
}

