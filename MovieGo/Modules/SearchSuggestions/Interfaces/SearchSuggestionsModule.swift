//
//  SearchSuggestionsModule.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 11/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation

protocol SearchSuggestionsDelegate: class {

    func onSelectKeyword(_ keyword: String)
}
