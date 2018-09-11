//
//  Storage.swift
//  Storage
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit
import CoreData

/// NSPersistentStoreCoordinator extension
extension NSPersistentStoreCoordinator {
    
    /// NSPersistentStoreCoordinator error types
    public enum CoordinatorError: Error {
        /// .momd file not found
        case modelFileNotFound
        /// NSManagedObjectModel creation fail
        case modelCreationError
        /// Gettings document directory fail
        case storePathNotFound
    }
    
    /// Return NSPersistentStoreCoordinator object
    static func coordinator(name: String) throws -> NSPersistentStoreCoordinator? {
        
        let storageBundle = Bundle(identifier: "com.azisseno.careemassignment.Storage")!
        guard let modelURL = storageBundle.url(forResource: name, withExtension: "momd") else {
            throw CoordinatorError.modelFileNotFound
        }
        
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            throw CoordinatorError.modelCreationError
        }
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        guard let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            throw CoordinatorError.storePathNotFound
        }
        
        do {
            let url = documents.appendingPathComponent("\(name).sqlite")
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true,
                            NSInferMappingModelAutomaticallyOption : true ]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            throw error
        }
        
        return coordinator
    }
}

public struct CoreDataStorage {
    
    /// Shared instance of storage
    public static var shared = CoreDataStorage()
    
    /// Set custom NSPersistentStoreCoordinator
    ///
    /// - Parameter pc: NSPersistentStoreCoordinator
    public static func setPersistentStoreCoordinator(_ pc: NSPersistentStoreCoordinator) {
        shared.persistentStoreCoordinator = pc
    }
        
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        do {
            return try NSPersistentStoreCoordinator.coordinator(name: "MovieStorage")
        } catch {
            print("CoreData: Unresolved error \(error)")
        }
        return nil
    }()
    
    private lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    private lazy var backgroundManagedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: Public methods
    public enum SaveStatus {
        case saved, rolledBack, hasNoChanges
    }
    
    /// Internal view context property for both iOS 9 and > iOS 10
    lazy var context: NSManagedObjectContext = {
        return managedObjectContext
    }()
    
    /// Internal background context property for both iOS 9 and > iOS 10
    lazy var backgroundContext: NSManagedObjectContext = {
        return backgroundManagedObjectContext
    }()
    
    /// Save changes of Core Data in background context
    ///
    /// - Returns: Enum of success status
    @discardableResult
    public mutating func save() -> SaveStatus {
        if context.hasChanges {
            do {
                try context.save()
                return .saved
            } catch {
                context.rollback()
                return .rolledBack
            }
        }
        return .hasNoChanges
    }

    /// Save changes of Core Data in background context
    ///
    /// - Returns: Enum of success status
    @discardableResult
    public mutating func backgroundSave() -> SaveStatus {
        if backgroundContext.hasChanges {
            do {
                try backgroundContext.save()
                return .saved
            } catch {
                backgroundContext.rollback()
                return .rolledBack
            }
        }
        return .hasNoChanges
    }
}
