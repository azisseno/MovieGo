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
    var searchResultsController: UIViewController? = nil

    lazy var searchController: UISearchController = UISearchController(searchResultsController: searchResultsController)
    
    /// Set SearchBar on NavigationBar
    /// If you dont set delegate expicitly, your UISearchResultController would be automatically assigned as `UISearchControllerDelegate`, `UISearchBarDelegate` and `UISearchResultsUpdating` delegate
    ///
    /// - Parameters:
    ///   - builder: Set your SearchResultController via router
    ///   - delegate: You may put `UISearchControllerDelegate`, `UISearchBarDelegate` and/or `UISearchResultsUpdating here and will be automatically assigned`
    ///   - placeholder: Search Bar text placeholder
    func setSearchBarOnNavigation(searchResultsViewBuilder: (() -> ())? = nil,
                                  searchBarDelegate: Any? = nil,
                                  searchResultsUpdating: Any? = nil,
                                  searchControllerDelegate: Any? = nil,
                                  placeholder: String = "Search") {
        
        searchResultsViewBuilder?()
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            navigationItem.titleView = searchController.searchBar
        }
        searchController.searchBar.placeholder = placeholder
        
        if #available(iOS 11.0, *) {
            navBar?.navigationBar.prefersLargeTitles = true
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
        definesPresentationContext = true
        
        setDelegate(searchBarDelegate: searchController.searchResultsController,
                    searchResultsUpdating: searchController.searchResultsController,
                    searchControllerDelegate: searchController.searchResultsController)

        setDelegate(searchBarDelegate: searchBarDelegate,
                    searchResultsUpdating: searchResultsUpdating,
                    searchControllerDelegate: searchControllerDelegate)
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
