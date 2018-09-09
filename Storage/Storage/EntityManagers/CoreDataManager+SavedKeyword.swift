//
//  CoreDataManager+SavedKeyword.swift
//  Storage
//
//  Created by Azis Senoaji Prasetyotomo on 09/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataManager where T: SavedKeyword {
    
    func saveKeyword(_ keyword: String) {
        insertObject.keyword = keyword
        Storage.shared.save()
    }
    
    /// Get keyword data from storage
    ///
    /// - Parameters:
    ///   - keyword: keyword filter
    ///   - backgroundFetch: which context do you want to use
    /// - Returns: Array of `SavedKeyword` entity
    func getData(withKeyword keyword: String? = nil, backgroundFetch: Bool = false) -> [T] {
        let request: NSFetchRequest<T> = NSFetchRequest<T>(entityName: entityName)
        if let keyword = keyword {
            let predicate = NSPredicate(format: "%K == %i", "keyword", keyword)
            request.predicate = predicate
        }
        let results: [T]?
        if backgroundFetch {
            results = try? Storage.shared.backgroundContext.fetch(request)
        } else {
            results = try? Storage.shared.context.fetch(request)
        }
        return results ?? [T]()
    }
    
    /// Remove keyword data
    ///
    /// - Parameter keyword: keyword to be deleted
    func removeData(withKeyword keyword: String) {
        let request: NSFetchRequest<T> = NSFetchRequest<T>(entityName: entityName)
        let predicate = NSPredicate(format: "%K == %i", "keyword", keyword)
        request.predicate = predicate
        let results = try? Storage.shared.backgroundContext.fetch(request)
        if let results = results {
            for result in results {
                Storage.shared.backgroundContext.delete(result)
            }
        }
        Storage.shared.save()
    }
}
