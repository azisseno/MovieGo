//
//  SearchSuggestionsDefaultInteractor.swift
//  SearchSuggestionsDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit
import Storage

class SearchSuggestionsDefaultInteractor: SearchSuggestionsInteractor {

    weak var presenter: SearchSuggestionsPresenter?

    func fetchSavedKeywordsFromLocal() {
        let manager = SavedKeywordManager()
        let savedKeywords = manager.getData(withLimit: 10)
        presenter?.handleSavedKeywords(keywords: savedKeywords)
    }

}
