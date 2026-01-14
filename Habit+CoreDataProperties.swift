//
//  Habit+CoreDataProperties.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//
//

public import Foundation
public import CoreData


public typealias HabitCoreDataPropertiesSet = NSSet

extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }
    // MARK: - Basic Fields
    @NSManaged public var id: UUID?
    @NSManaged public var habitTitle: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var habitDescription: String?

    // MARK: - Habit Type (build/quit)
    @NSManaged public var habitType: String?

    // MARK: - Date Range
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?

    // MARK: - Task Days
    @NSManaged public var isEveryday: Bool
    @NSManaged public var taskDays: String?

    // MARK: - Time Range
    @NSManaged public var timeRange: String?

    // MARK: - Goal Value
    @NSManaged public var goalValue: Int32
    @NSManaged public var goalUnit: String?

}

extension Habit : Identifiable {

}
