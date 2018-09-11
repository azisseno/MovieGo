//
//  SearchSuggestionsDefaultBuilder.swift
//  SearchSuggestionsDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit

class SearchSuggestionsDefaultBuilder {

    func main() -> UIViewController {

        let storyboard: UIStoryboard = UIStoryboard(name: "SearchSuggestions", bundle: nil)
        let view = storyboard.instantiateInitialViewController() as! SearchSuggestionsDefaultViewController
        let interactor = SearchSuggestionsDefaultInteractor()
        let presenter = SearchSuggestionsDefaultPresenter()
        let router = SearchSuggestionsDefaultRouter()
        let controller = BaseNavigationViewController(rootViewController: view)

        interactor.presenter = presenter

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        router.presenter = presenter
        router.viewController = view

        return controller
    }
}
