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
public protocol CoreDataManager {
    /// Entity type
    associatedtype T = NSManagedObject
}

extension CoreDataManager {
    
    /// return an entity object
    var insertObject: T {
        guard let insertObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: CoreDataStorage.shared.backgroundContext) as? T else {
            fatalError("Entity doesn't exist")
        }
        return insertObject
    }

    /// Entity name in `String` type
    var entityName: String {
        return String(describing: T.self)
    }
}
