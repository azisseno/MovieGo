//
//  SavedKeywordManager.swift
//  Storage
//
//  Created by Azis Senoaji Prasetyotomo on 09/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import CoreData

public class SavedKeywordManager: CoreDataManager {
    
    public typealias T = SavedKeyword
    
    /// Save keyword to core data
    ///
    /// - Parameter keyword: keyword from search bar
    public func saveKeyword(_ keyword: String) {
        if let existingObject = getData(withKeyword: keyword, backgroundFetch: true).first {
            existingObject.timestamp = Date()
        } else {
            let object = insertObject
            object.keyword = keyword
            object.timestamp = Date()
        }
    }
    
    /// Get keyword data from storage
    ///
    /// - Parameters:
    ///   - keyword: keyword filter
    ///   - backgroundFetch: which context do you want to use
    /// - Returns: Array of `SavedKeyword` entity
    public func getData(withKeyword keyword: String? = nil, backgroundFetch: Bool = false) -> [SavedKeyword] {
        let request: NSFetchRequest<SavedKeyword> = NSFetchRequest<SavedKeyword>(entityName: entityName)
        if let keyword = keyword {
            let predicate = NSPredicate(format: "%K == %@", "keyword", keyword)
            request.predicate = predicate
        }
        let sort = NSSortDescriptor(key: "timestamp", ascending: false)
        request.sortDescriptors = [sort]
        let results: [SavedKeyword]?
        if backgroundFetch {
            results = try? CoreDataStorage.shared.backgroundContext.fetch(request)
        } else {
            results = try? CoreDataStorage.shared.context.fetch(request)
        }
        return results ?? [SavedKeyword]()
    }
    
    /// Remove keyword data
    ///
    /// - Parameter keyword: keyword to be deleted
    public func removeData(withKeyword keyword: String) {
        let request: NSFetchRequest<SavedKeyword> = NSFetchRequest<SavedKeyword>(entityName: entityName)
        let predicate = NSPredicate(format: "%K == %@", "keyword", keyword)
        request.predicate = predicate
        let results = try? CoreDataStorage.shared.backgroundContext.fetch(request)
        if let results = results {
            for result in results {
                CoreDataStorage.shared.backgroundContext.delete(result)
            }
        }
        CoreDataStorage.shared.save()
    }
}
