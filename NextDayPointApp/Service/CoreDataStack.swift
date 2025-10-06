//
//  CoreDataService.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import CoreData

class CoreDataStack{
     static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NextDayPointApp")
        container.loadPersistentStores(completionHandler: {(_, error) in
            //TODO: add error handling
        })
        return container
    }()
    
    var context: NSManagedObjectContext{
        CoreDataStack.container.viewContext
    }
    
    func saveContext() throws {
        try context.save()
    }
}
