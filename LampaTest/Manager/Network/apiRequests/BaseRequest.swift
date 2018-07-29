//
//  BaseRequest.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation
import RxSwift

class BaseRequest{
    
    static func startRequest(url: URL, method: RequstMethods, body: Data?, header: [String: String]?) -> Observable<Data>{
        return Observable<Data>.create({ (observer) -> Disposable in
            let requset = NSMutableURLRequest(url: url)
            requset.httpBody = body
            requset.httpMethod = method.rawValue
            requset.addValue("application/json",forHTTPHeaderField: "Content-Type")
            
            if header != nil{
                for value in header!{
                    requset.addValue(value.value, forHTTPHeaderField: value.key)
                }
            }
            
            print(url.absoluteString)
            
            URLSession.shared.dataTask(with: requset as URLRequest, completionHandler: { (data, response, error) in
                if error != nil{
                    observer.onError(error!)
                    return
                }
                observer.onNext(data!)
            }).resume()
            
            return Disposables.create()
        })
    }
    
}


enum RequstMethods: String{
    case GET,POST,PUT
}
