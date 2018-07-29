//
//  MovieEntity.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation

struct MovieDataEntity: Codable {
    let page: Int?
    let total_results: Int?
    let total_pages: Int?
    let results: [MovieEntity]?
}
