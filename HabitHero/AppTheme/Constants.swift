//
//  Constants.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import Foundation
import CoreGraphics
import SwiftUI

enum AppSpacing {
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
}



struct Constants {
    // MARK: - Tab Names
    static let home = "Home"
    
    // MARK: - Habit List Names
    static let habitListTitle = "Habits"

    // MARK: - Add New Habit View Names
    static let addNewHabit = "Add New Habit"
    static let save = "Save"
    static let cancel = "Cancel"
    
    static let habitName = "Habit Name"
    static let habitNameTextFieldPlaceholder = "Enter habit name here..."
    static let habitType = "Habit Type"
    static let habitDuration = "Habit Duration"

    static let description = "Description"
    static let descriptionTextFieldPlaceholder = "Enter description name here..."
    
    static let startDate = "Start Date"
    static let endDate = "End Date"
    static let taskDays = "Task Days"
    static let everyDay = "Everyday"
    static let none = "None"
    static let chooseDays = "Choose Days"
    static let timeRange = "Time Range"
    
    static let goal = "Goal"
    static let goalValueTitle = "Goal Value:"
    static let quantity = "Quantity"
    static let time = "Time"
    static let unitType = "Unit Type"
    static let selectUnit = "Select Unit"
    static let done = "Done"
    
    // MARK: - Numbered constants

    static let opacityValue: Double = 0.3
    static let styleValue: CGFloat = 10

    //ImageName
    static let homeImage = "house.fill"
    static let checkmarkImage = "checkmark"
    static let addHabitImage = "plus.circle.fill"
    
    static let missingHabitTitle = "Habit title is required"
    static let invalidErrorText = "Invalid"
    static let requiredFieldText = "Required"
    static let okText = "OK"

}
