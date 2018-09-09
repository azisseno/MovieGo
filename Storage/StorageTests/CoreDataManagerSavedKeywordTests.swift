//
//  CoreDataManagerSavedKeywordTests.swift
//  StorageTests
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation

import XCTest
import CoreData
@testable import Storage

class CoreDataManagerSavedKeywordTests: XCTestCase {
    
    lazy var storageHelper: StorageTestHelper = StorageTestHelper()
    
    override func setUp() {
        super.setUp()
        storageHelper.initStorage()
    }
    
    func testAddKeyword() {
        let manager = CoreDataManager<Storage.SavedKeyword>()
        manager.saveKeyword("Batman")
        
    }
    
}

