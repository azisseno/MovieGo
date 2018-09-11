//
//  SearchSuggestionsDefaultViewController.swift
//  SearchSuggestionsDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 11..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit

class SearchSuggestionsDefaultViewController: BaseTableViewController, SearchSuggestionsViewController {

    //MARK: - Instances
    fileprivate let searchResultKey = "searchSuggestionsResultsHidden"
    lazy var header: InfoTextView = InfoTextView.fromNib()
    var presenter: SearchSuggestionsPresenter?
    let dataSource = SuggestionsDataSource()
    
    //MARK: - SuperClass Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: - Setup SubViews
    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .lightGray
        tableView.reloadData()
    }
    
    func showSuggestions(keywords: [String]) {
        dataSource.suggestions = keywords
        tableView.reloadData()
    }
}

extension SearchSuggestionsDefaultViewController: UISearchControllerDelegate {
    func didPresentSearchController(_ searchController: UISearchController) {
        searchController.searchResultsController?.view.isHidden = false
        presenter?.onViewLoad()
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        searchController.searchResultsController?.view.isHidden = true
    }
}

extension SearchSuggestionsDefaultViewController {
    
    //MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header.set(text: "Suggested Search")
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onSelectKeyword(keyword: dataSource.suggestions[indexPath.row])
    }
}
