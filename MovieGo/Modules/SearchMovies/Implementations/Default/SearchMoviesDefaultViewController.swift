//
//  SearchMoviesDefaultViewController.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit

class SearchMoviesDefaultViewController: BaseTableViewController, SearchMoviesViewController {

    var presenter: SearchMoviesPresenter?
    var dataSource: UITableViewDataSource!
    
    //MARK: - SubView instances
    lazy var suggestionView: InfoTextView = {
        guard let view = InfoTextView.instantiateFromNib() else {
            fatalError("Nib is doesn't exist")
        }
        return view
    }()
    
    //MARK: - SuperClass Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSearchBarOnNavigation(delegate: self)
    }
    
    //MARK: - Setup SubViews
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    func reloadData() {
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}

extension SearchMoviesDefaultViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.onTapSearchButton()
    }
}

extension SearchMoviesDefaultViewController {
    
    //MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        suggestionView.label.text = "Suggestions"
        return suggestionView
    }
}
