//
//  TestModuleDefaultBuilder.swift
//  TestModuleDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 09..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit

class TestModuleDefaultBuilder {

func main() -> UIViewController {
let view = TestModuleDefaultViewController()
let interactor = TestModuleDefaultInteractor()
let presenter = TestModuleDefaultPresenter()
let router = TestModuleDefaultRouter()
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
