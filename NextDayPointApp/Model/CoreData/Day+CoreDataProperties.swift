//
//  Day+CoreDataProperties.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 05.10.2025.
//
//

public import Foundation
public import CoreData


public typealias DayCoreDataPropertiesSet = NSSet

extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var date: Date?
    @NSManaged public var dayDescription: String?
    @NSManaged public var rating: Int16

}

extension Day : Identifiable {

}
