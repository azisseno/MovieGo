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
        
    //MARK: - Instances
    lazy var emptyState: EmptyStateView = {
        let view: EmptyStateView = EmptyStateView.fromNib()
        view.setLabel(text: SearchMoviesConstant.initialText,
                            emoticon: "🎬")
        return view
    }()
    var presenter: SearchMoviesPresenter?
    let dataSource = MovieListDataSource()
    
    //MARK: - SuperClass Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Movie Go"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSearchBarOnNavigation(searchBarDelegate: self,
                                 placeholder: "Find movie here ...")
    }
    
    override var searchResultsController: UIViewController? {
        return SearchSuggestionsDefaultBuilder().main()
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
    func showMovies(_ movies: [Movie]) {
        if movies.count <= 0 {
            emptyState.setLabel(text: SearchMoviesConstant.notFoundText,
                                emoticon: "😔")
        }
        dataSource.movies = movies
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
        emptyState.setLabel(text: errorMessage,
                            emoticon: "😔")
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
        dataSource.movies = []
        emptyState.setLabel(text: SearchMoviesConstant.loadingText,
                            emoticon: "🍿")
        tableView.reloadData()
        refreshControl?.beginRefreshing()
        presenter?.onTapSearchButton(keyword: searchBar.text ?? "")
    }
}

extension SearchMoviesDefaultViewController {
    
    //MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dataSource.movies.count > 0 ? 0 : tableView.frame.height * 0.6
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return dataSource.movies.count > 0 ? nil : emptyState
    }
    
    //MARK: - UIScrollView Delegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isReachingBottom() {
            presenter?.onReachBottomScroll()
        }
    }
}
