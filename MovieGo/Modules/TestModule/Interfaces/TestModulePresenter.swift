//
//  TestModulePresenter.swift
//  TestModule
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 09..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

protocol TestModulePresenter: class {

var router: TestModuleRouter? { get set }
var interactor: TestModuleInteractor? { get set }
var view: TestModuleViewController? { get set }
}
