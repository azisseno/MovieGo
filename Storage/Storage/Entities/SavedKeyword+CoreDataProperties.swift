//
//  SavedKeyword+CoreDataProperties.swift
//  Storage
//
//  Created by Azis Senoaji Prasetyotomo on 11/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//
//

import Foundation
import CoreData


public extension SavedKeyword {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedKeyword> {
        return NSFetchRequest<SavedKeyword>(entityName: "SavedKeyword")
    }

    @NSManaged public var keyword: String
    @NSManaged public var timestamp: Date

}
