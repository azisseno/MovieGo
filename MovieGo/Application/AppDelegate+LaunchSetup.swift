//
//  AppDelegate+InitialScreen.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit
import Api
import Storage

extension AppDelegate {
    
    func launchSetup() {
        Api.initInstance(apiBasePath: Constant.apiBasePath)
        let _ = CoreDataStorage.shared
        setupInitialScreen()
    }
    
    func setupInitialScreen() {
        let moviesVC = SearchMoviesDefaultBuilder().main()
        window?.rootViewController = moviesVC
        window?.makeKeyAndVisible()
    }
}
