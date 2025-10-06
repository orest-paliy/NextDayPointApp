//
//  CoreDataRepositoryImpl.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import CoreData

class CoreDataRepository<T: NSManagedObject>: Repository{
    typealias Entity = T
    
    let coreDataStack = CoreDataStack()
    
    func create(configure: (Entity) -> Void) throws {
        let entity = Entity(context: coreDataStack.context)
        configure(entity)
        try coreDataStack.saveContext()
    }
    
    func fetch(by predicate: NSPredicate) throws -> [Entity] {
        let entityName = String(describing: Entity.self)
        let fetchRequest = NSFetchRequest<Entity>(entityName: entityName)
        fetchRequest.predicate = predicate
        return try coreDataStack.context.fetch(fetchRequest)
    }
    
    //TODO: realize
    func update() throws {
        try coreDataStack.saveContext()
    }
    
    func delete(item: Entity) throws {
        coreDataStack.context.delete(item)
        try coreDataStack.saveContext()
    }
}
