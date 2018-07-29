//
//  ApiRequest.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation
import RxSwift


class ApiRequset{
    
    static func getTenNews(page: Int) -> Observable<MovieDataEntity?>{
        return Observable<MovieDataEntity?>.create({ (movieData) -> Disposable in
            let url = apiUrl.getPopularMovieURL(page: page)
            BaseRequest.startRequest(url: url, method: .GET, body: nil, header: nil).subscribe { (response) in
                if response.error != nil{
                    movieData.onError(response.error!)
                    return
                }
                
                movieData.onNext(try? JSONDecoder().decode(MovieDataEntity.self, from: response.element!))
            }
            
            return Disposables.create()
        })

    }
    
}
