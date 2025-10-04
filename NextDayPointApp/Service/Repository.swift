//
//  Repository.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import CoreData

protocol Repository{
    associatedtype Entity: NSManagedObject
    
    //MARK: CRUD
    func create(configure: (Entity) -> Void) throws
    func fetch(by predicate: NSPredicate) throws -> [Entity]
    func update(item: Entity) throws
    func delete(item: Entity) throws
}
