//
//  SearchSuggestionsDefaultPresenter.swift
//  SearchSuggestionsDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import Storage

class SearchSuggestionsDefaultPresenter: SearchSuggestionsPresenter {
    
    var router: SearchSuggestionsRouter?
    var interactor: SearchSuggestionsInteractor?
    weak var view: SearchSuggestionsViewController?
    
    func handleSavedKeywords(keywords: [SavedKeyword]) {
        let keywordTexts = keywords.map { $0.keyword }
        view?.showSuggestions(keywords: keywordTexts)
    }
    
    func onViewLoad() {
        interactor?.fetchSavedKeywordsFromLocal()
    }
    
    func onSelectKeyword(keyword: String) {
        router?.closeSearchSuggestions(keyword: keyword)
    }
}
