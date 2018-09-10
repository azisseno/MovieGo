//
//  BaseTableViewController.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    /// Return nearest BaseNavigationViewController
    final var navBar: BaseNavigationViewController? {
        return navigationController as? BaseNavigationViewController
    }
    
    /// Used as searchResultsController of SearchController
    var searchResultsController: UIViewController? {
        return nil
    }

    lazy var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    /// Set SearchBar on NavigationBar
    ///
    /// - Parameters:
    ///   - delegate: You may put `UISearchControllerDelegate`, `UISearchBarDelegate` and/or `UISearchResultsUpdating here and will be automatically assigned`
    ///   - placeholder: Search Bar text placeholder
    func setSearchBarOnNavigation(delegate: Any,
                      placeholder: String = "Search") {
        if let delegate = delegate as? UISearchBarDelegate {
            searchController.searchBar.delegate = delegate
        }
        if let delegate = delegate as? UISearchControllerDelegate {
            searchController.delegate = delegate
        }
        if let delegate = delegate as? UISearchResultsUpdating {
            searchController.searchResultsUpdater = delegate
        }
        searchController.searchBar.placeholder = placeholder
        
        if #available(iOS 11.0, *) {
            navBar?.navigationBar.prefersLargeTitles = true
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            
        } else {
            searchController.hidesNavigationBarDuringPresentation = false
            navigationItem.titleView = searchController.searchBar
        }
        
        if #available(iOS 9.1, *) {
            searchController.obscuresBackgroundDuringPresentation = false
        } else {
            searchController.dimsBackgroundDuringPresentation = false
        }
    }

}
