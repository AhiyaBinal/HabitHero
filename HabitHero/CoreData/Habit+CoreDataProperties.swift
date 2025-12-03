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

    @NSManaged public var id: UUID?
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?

}

extension Habit : Identifiable {

}
