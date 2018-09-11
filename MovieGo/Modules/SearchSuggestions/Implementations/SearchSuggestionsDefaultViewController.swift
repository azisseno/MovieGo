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
    
}
