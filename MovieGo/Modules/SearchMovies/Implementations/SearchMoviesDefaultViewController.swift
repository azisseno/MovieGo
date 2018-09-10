//
//  SearchMoviesDefaultViewController.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit
import Api

class SearchMoviesDefaultViewController: BaseTableViewController, SearchMoviesViewController {
    
    var presenter: SearchMoviesPresenter?
    let dataSource = MovieListDataSource()
    private var totalPages: Int = 0
    private var currentPages: Int = 0
    private var totalResults: Int = 0
    
    //MARK: - SuperClass Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Movie Go"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSearchBarOnNavigation(delegate: self)
    }
    
    //MARK: - Setup SubViews
    private func setupTableView() {
        tableView.estimatedRowHeight = 220
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self,
                                  action: #selector(handleRefresh),
                                  for: .valueChanged)
        refreshControl?.tintColor = .darkGray
    }
    
    //MARK: - View handlers
    func showNewListOfMovies(_ movies: [Movie], totalPages: Int, totalResults: Int) {
        dataSource.movies = []
        tableView.reloadData()
        dataSource.movies = movies
        self.totalPages = totalPages
        self.totalResults = totalResults
        currentPages = 1
        reloadData()
    }
    
    func appendMovies(_ movies: [Movie]) {
        dataSource.movies += movies
        currentPages += 1
        reloadData()
    }
    
    @objc func handleRefresh() {
        presenter?.onPullToRefresh()
    }
    
    func reloadData() {
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func showErrorMessage(_ errorMessage: String) {
        showSnackAlert(message: errorMessage)
        refreshControl?.endRefreshing()
    }
}

extension SearchMoviesDefaultViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if #available(iOS 11.0, *) {
            navigationItem.searchController?.dismiss(animated: true, completion: nil)
        } else {
            searchBar.resignFirstResponder()
        }
        refreshControl?.beginRefreshing()
        presenter?.onTapSearchButton(keyword: searchBar.text ?? "")
    }
}

extension SearchMoviesDefaultViewController {
    
    //MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //MARK: - UIScrollView Delegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if currentPages > 0,
            currentPages <= totalPages,
            scrollView.isReachingBottom() {
            presenter?.onReachBottomScroll()
        }
    }
}
