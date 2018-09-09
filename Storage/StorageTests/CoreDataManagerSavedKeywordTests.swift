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
        storageHelper.setupMockCoreData()
    }
    
    func testSavedKeywordManager() {
        // 1. Add 1 keyword `Batman`
        let manager = SavedKeywordManager()
        manager.saveKeyword("Batman")
        
        // 2. Save data with assertion
        XCTAssertTrue(CoreDataStorage.shared.backgroundSave() == .saved)
        
        // 3. Get all data
        let results = manager.getData()
        
        // 4. Assertion results
        XCTAssertTrue(results.count > 0)
        
        // 5. Get all keyword == `Batman`
        let resultsOfBatman = manager.getData(withKeyword: "Batman")
        
        // 6. Assertion results with batman query
        XCTAssertTrue(resultsOfBatman.first?.keyword == "Batman")
        
        // 7. Removing keyword Batman from data
        manager.removeData(withKeyword: "Batman")
        
        // 8. Save data with assertion
        XCTAssertTrue(CoreDataStorage.shared.backgroundSave() == .saved)
        
        // 9. Get all results after removing
        let resultsAfterRemoval = manager.getData()
        
        // 10. Assertion results after removing `Batman`
        XCTAssertTrue(resultsAfterRemoval.count == 0)
    }
    
    
}

