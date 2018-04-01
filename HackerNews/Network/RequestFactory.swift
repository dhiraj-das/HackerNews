//
//  RequestFactory.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

class RequestFactory {
    
    static func requestTopStories() -> ServiceRequest {
        let urlString = "https://hacker-news.firebaseio.com/v0/topstories.json"
        
        let request = RequestBuilder()
            .ofType(.get)
            .set(urlString: urlString)
            .build()
        
        return request
    }
    
    static func requestItem(withId id: Int) -> ServiceRequest {
        let urlString = "https://hacker-news.firebaseio.com/v0/item/\(id).json"
        
        let request = RequestBuilder()
            .ofType(.get)
            .set(urlString: urlString)
            .build()
        
        return request
    }
}
