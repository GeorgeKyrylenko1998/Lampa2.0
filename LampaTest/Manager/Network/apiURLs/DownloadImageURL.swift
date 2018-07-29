//
//  DownloadImageURL.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation

class ImageUrl{
    
    static let baseURL = "https://image.tmdb.org/t/p/w500"
    
    static func getDownloadURL(path: String) -> URL{
        return URL(string: baseURL + path)!
    }
    
}
