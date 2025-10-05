//
//  CoreDataRepositoryImpl.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import CoreData

class CoreDataRepositoryImpl<T: NSManagedObject>: Repository{
    typealias Entity = T
    
    let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func create(configure: (Entity) -> Void) throws {
        let entity = Entity(context: coreDataStack.context)
        configure(entity)
        try coreDataStack.saveContext()
    }
    
    func fetch(by predicate: NSPredicate) throws -> [Entity] {
        let entityName = Entity.entity().name
        guard let entityName else{
            print(entityName)
            return []
        }
        let fetchRequest = NSFetchRequest<Entity>(entityName: entityName)
        fetchRequest.predicate = predicate
        return try coreDataStack.context.fetch(fetchRequest)
    }
    
    //TODO: realize
    func update(item: Entity) throws {
        fatalError("Not implemented")
    }
    
    func delete(item: Entity) throws {
        coreDataStack.context.delete(item)
        try coreDataStack.saveContext()
    }
}
