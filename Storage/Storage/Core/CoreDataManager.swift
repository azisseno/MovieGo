//
//  CoreDataManager.swift
//  Storage
//
//  Created by Azis Senoaji Prasetyotomo on 09/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import CoreData
import UIKit

//MARK: - Core Data Manager
/// A helper that make your life easier in managing your Core Data :D
/// Just extend this class to easily manage your Entity
class CoreDataManager<T: NSManagedObject> {
    
    /// Entity name in `String` type
    lazy var entityName: String = {
        return String(describing: T.self)
    }()
    
    /// return an entity object
    lazy var insertObject: T = {
        guard let insertObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: Storage.shared.context) as? T else {
            fatalError("Entity doesn't exist")
        }
        return insertObject
    }()
    
    /// Save changes of Core Data in background context
    ///
    /// - Returns: Boolean of success
    @discardableResult
    func backgroundSave() -> Bool {
        if Storage.shared.backgroundContext.hasChanges {
            do {
                try Storage.shared.backgroundContext.save()
                return true
            } catch {
                return false
            }
        }
        return true
    }
}
