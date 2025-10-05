//
//  CoreDataProtocol.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import CoreData

protocol CoreDataStack{
    var context: NSManagedObjectContext {get}
    func saveContext() throws
}
