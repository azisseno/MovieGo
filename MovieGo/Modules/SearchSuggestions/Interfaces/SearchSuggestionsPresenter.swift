//
//  SearchSuggestionsPresenter.swift
//  SearchSuggestions
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import Storage

protocol SearchSuggestionsPresenter: class {

    var router: SearchSuggestionsRouter? { get set }
    var interactor: SearchSuggestionsInteractor? { get set }
    var view: SearchSuggestionsViewController? { get set }
    
    func handleSavedKeywords(keywords: [SavedKeyword])
    func onViewLoad()
    func onSelectKeyword(keyword: String)

}
