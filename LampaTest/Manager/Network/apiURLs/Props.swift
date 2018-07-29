//
//  Props.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation


class PropsManager{
    
    static let apiKey = "f910e2224b142497cc05444043cc8aa4"
    
    static func getProps(props: [String: Any]?) -> String{
        var prop = "?api_key=\(apiKey)"
        for propItem in props!{
            prop+="&\(propItem.key)=\(propItem.value)"
        }
        
        return prop
    }
}
