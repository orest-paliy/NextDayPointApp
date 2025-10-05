//
//  CoreDataService.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import CoreData

class CoreDataStackImpl: CoreDataStack{
     static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NextDayPointApp")
        container.loadPersistentStores(completionHandler: {(_, error) in
            //TODO: add error handling
            print(error.debugDescription)
        })
        return container
    }()
    
    var context: NSManagedObjectContext{
        CoreDataStackImpl.container.viewContext
    }
    
    func saveContext() throws {
        try context.save()
    }
    
    
}
