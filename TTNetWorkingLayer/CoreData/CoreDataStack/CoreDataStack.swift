//
//  CoreDataStack.swift
//  NIKKAN-iREX
//
//  Created by Than Trong Tuan on 9/23/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: CoreDataStackProtocol {
    static var viewContext: NSManagedObjectContext = {
        guard let modelURL = Foundation.Bundle.main.url(forResource: "TTNetworkingLayer", withExtension: "momd") else {
            fatalError("cannot create modelURL")
        }
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("cannot create model with url \(modelURL)")
            
        }
        let container = NSPersistentContainer(name: "NikkanIrex", managedObjectModel: model)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container.viewContext
    }()
}
