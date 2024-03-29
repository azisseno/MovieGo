//
//  SearchSuggestionsRouter.swift
//  SearchSuggestions
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

protocol SearchSuggestionsRouter {

    var presenter: SearchSuggestionsPresenter? { get set }
    func closeSearchSuggestions(keyword: String)
}
