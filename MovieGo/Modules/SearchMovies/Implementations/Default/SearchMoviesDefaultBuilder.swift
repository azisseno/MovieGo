//
//  SearchMoviesDefaultBuilder.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit

class SearchMoviesDefaultBuilder {

    func main() -> UIViewController {
        let view = SearchMoviesDefaultViewController()
        let interactor = SearchMoviesDefaultInteractor()
        let presenter = SearchMoviesDefaultPresenter()
        let router = SearchMoviesDefaultRouter()
        let controller = UINavigationController(rootViewController: view)

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        router.presenter = presenter
        router.viewController = view

        return controller
    }
}
