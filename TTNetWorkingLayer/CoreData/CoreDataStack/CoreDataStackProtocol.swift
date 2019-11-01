//
//  CoreDataStackProtocol.swift
//  NIKKAN-iREX
//
//  Created by Than Trong Tuan on 9/23/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import Foundation
import CoreData

public protocol CoreDataStackProtocol {
    static var viewContext: NSManagedObjectContext { get }
}

public extension CoreDataStackProtocol {
    static func saveContextWithBlock(_ block: @escaping () -> Void, completion: ((NSError?) -> Void)? = nil) {
        viewContext.performAndWait {
            block()
        }
        do {
            try viewContext.save()
        } catch let error as NSError {
            completion?(error)
        }
    }
    
    static func fetchEntity<T: NSManagedObject>(_ entity: T.Type, predicate: NSPredicate? = nil) -> [T]? {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: entity))
        fetchRequest.predicate = predicate
        var objects: [T]?
        viewContext.performAndWait {
            do {
                objects = try viewContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Error fetch data: \(error.localizedDescription)")
            }
        }
        return objects
    }
    
    static func batchDeleteWithEntity<T: NSManagedObject>(_ entity: T.Type, predicate: NSPredicate? = nil) {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: entity))
        fetch.predicate = predicate
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            let result = try viewContext.execute(request) as? NSBatchDeleteResult
            guard let objectIds = result?.result as? [NSManagedObjectID] else { return }
            let changes = [NSDeletedObjectsKey: objectIds]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [viewContext])
        } catch {
            fatalError("Failed to perform batch update: \(error)")
        }
    }
    
    static func save() {
        guard viewContext.hasChanges else { return }
        try? viewContext.save()
    }
}
