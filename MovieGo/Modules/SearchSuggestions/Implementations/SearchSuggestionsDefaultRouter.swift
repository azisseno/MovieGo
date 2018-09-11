//
//  SearchSuggestionsDefaultRouter.swift
//  SearchSuggestionsDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit

class SearchSuggestionsDefaultRouter: SearchSuggestionsRouter {

    weak var presenter: SearchSuggestionsPresenter?
    weak var viewController: UIViewController?
    unowned var delegate: SearchSuggestionsDelegate
    
    init(delegate: SearchSuggestionsDelegate) {
        self.delegate = delegate
    }
    
    func closeSearchSuggestions(keyword: String) {
        delegate.onSelectKeyword(keyword)
    }
}
