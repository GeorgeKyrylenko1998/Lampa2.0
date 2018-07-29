//
//  NewsSearchBarDelegate.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/30/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

extension NewsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterNews(title: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
