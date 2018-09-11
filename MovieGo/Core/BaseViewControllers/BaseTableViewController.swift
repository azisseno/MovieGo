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

    private lazy var searchController: UISearchController = UISearchController(searchResultsController: searchResultsController)
    
    /// Set SearchBar on NavigationBar
    ///
    /// - Parameters:
    ///   - delegate: You may put `UISearchControllerDelegate`, `UISearchBarDelegate` and/or `UISearchResultsUpdating here and will be automatically assigned`
    ///   - placeholder: Search Bar text placeholder
    func setSearchBarOnNavigation(searchBarDelegate: Any? = nil,
                                  searchResultsUpdating: Any? = nil,
                                  searchControllerDelegate: Any? = nil,
                                  placeholder: String = "Search") {
        
        searchController.searchBar.placeholder = placeholder
        setDelegate(searchBarDelegate: searchBarDelegate,
                    searchResultsUpdating: searchResultsUpdating,
                    searchControllerDelegate: searchControllerDelegate)
        
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
    
    private func setDelegate(searchBarDelegate: Any?,
                             searchResultsUpdating: Any?,
                             searchControllerDelegate: Any?) {
        if let delegate = searchBarDelegate as? UISearchBarDelegate {
            searchController.searchBar.delegate = delegate
        }
        if let delegate = searchControllerDelegate as? UISearchControllerDelegate {
            searchController.delegate = delegate
        }
        if let delegate = searchResultsUpdating as? UISearchResultsUpdating {
            searchController.searchResultsUpdater = delegate
        }
    }

}
