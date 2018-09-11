//
//  SearchMoviesDefaultInteractor.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit
import Api
import Alamofire
import Storage

class SearchMoviesDefaultInteractor: SearchMoviesInteractor {

    private var response: MovieResponse!
    private var currentKeyword: String = ""
    var request: DataRequest?
    
    weak var presenter: SearchMoviesPresenter?
    private var requestState: RequestState = .ready
    
    func reFetch(keyword: String? = nil) {
        if let keyword = keyword {
            currentKeyword = keyword
        }
        fetchMovie(
            page: 1,
            keyword: currentKeyword)
    }
    
    func fetchMoreIfNeeded() {
        guard response.page <= response.total_pages else { return }
        fetchMovie(
            page: response.page + 1,
            keyword: currentKeyword)
    }

    func fetchMovie(page: Int, keyword: String) {
        guard requestState != .loading else { return }
        if !Connectivity.isConnectedToInternet {
            presenter?.handleErrorRequest(response: Connectivity.error)
        }
        requestState = .loading
        request = MovieServices.getSearchMovie(
            query: keyword,
            page: page,
            onSuccess: { [weak self] response in
                self?.response = response
                self?.requestState = .success
                self?.saveKeywordToCoreData()
                self?.presenter?.handleSuccessRequest(response: response)
            },
            onFailure: { [weak self] error in
                self?.requestState = .error
                self?.presenter?.handleErrorRequest(response: error)
            }
        ).call()
    }
    
    func saveKeywordToCoreData() {
        guard response.total_results > 0 else { return }
        let manager = SavedKeywordManager()
        manager.saveKeyword(currentKeyword)
        CoreDataStorage.shared.backgroundSave()
    }
}
