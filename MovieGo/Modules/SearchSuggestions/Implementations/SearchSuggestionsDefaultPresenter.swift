//
//  SearchSuggestionsDefaultPresenter.swift
//  SearchSuggestionsDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

class SearchSuggestionsDefaultPresenter: SearchSuggestionsPresenter {

    var router: SearchSuggestionsRouter?
    var interactor: SearchSuggestionsInteractor?
    weak var view: SearchSuggestionsViewController?
}