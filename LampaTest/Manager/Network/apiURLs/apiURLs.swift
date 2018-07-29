//
//  apiURLs.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation

class apiUrl {
    static let baseURL = "https://api.themoviedb.org/3/"
    
    static func getPopularMovieURL(page: Int) -> URL{
        var urlString = baseURL + "movie/popular"
        
        let props = ["language":Locale.current.languageCode ?? "en", "page": page] as? [String:Any]
        
        urlString += PropsManager.getProps(props: props)
        return URL(string: urlString)!
    }
}
