//
//  StorageTestHelper.swift
//  StorageTests
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import CoreData
@testable import Storage

class StorageTestHelper {

    private lazy var managedObjectModel: NSManagedObjectModel = {
        let managedObjectModel = NSManagedObjectModel.mergedModel(
            from: [Bundle(for: type(of: self))])
        return managedObjectModel!
    }()
    
    private lazy var mockPersistentStoreCoordinator: NSPersistentStoreCoordinator = {
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let failureReason = "There was an error creating or loading the application’s saved data."
        do {
            try coordinator?.addPersistentStore(ofType: NSInMemoryStoreType,
                                                configurationName: nil,
                                                at: nil,
                                                options: nil)
        } catch {
            fatalError(error.localizedDescription)
        }
        return coordinator!
    }()
    
    private lazy var mockPersistantContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MovieStorage", managedObjectModel: self.managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )
            
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()

    func initStorage() {
        CoreDataStorage.initInstance()
        CoreDataStorage.setPersistentContainer(mockPersistantContainer)
        CoreDataStorage.setPersistentStoreCoordinator(mockPersistentStoreCoordinator)
    }
    
}
