//
//  CoreDataManager+SavedKeyword.swift
//  Storage
//
//  Created by Azis Senoaji Prasetyotomo on 09/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import CoreData

class SavedKeywordManager: CoreDataManager<SavedKeyword> {
    /// Save keyword to core data
    ///
    /// - Parameter keyword: keyword from search bar
    func saveKeyword(_ keyword: String) {
        insertObject.keyword = keyword
    }
    
    /// Get keyword data from storage
    ///
    /// - Parameters:
    ///   - keyword: keyword filter
    ///   - backgroundFetch: which context do you want to use
    /// - Returns: Array of `SavedKeyword` entity
    func getData(withKeyword keyword: String? = nil, backgroundFetch: Bool = false) -> [SavedKeyword] {
        let request: NSFetchRequest<SavedKeyword> = NSFetchRequest<SavedKeyword>(entityName: entityName)
        if let keyword = keyword {
            let predicate = NSPredicate(format: "%K == %@", "keyword", keyword)
            request.predicate = predicate
        }
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
    func removeData(withKeyword keyword: String) {
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
