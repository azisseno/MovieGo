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
class CoreDataManager<T: NSManagedObject> {
    
    lazy var entityName: String = {
        return String(describing: T.self)
    }()
    
    lazy var insertObject: T = {
        guard let insertObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: Storage.shared.context) as? T else {
            fatalError("Entity doesn't exist")
        }
        return insertObject
    }()
    
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
