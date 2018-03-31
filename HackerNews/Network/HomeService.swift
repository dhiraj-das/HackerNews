//
//  HomeService.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

fileprivate struct Endpoints {
    static let topStories = "https://hacker-news.firebaseio.com/v0/topstories.json"
}

class HomeService {
    
    private var apiClient: ApiClient!
    
    init() {
        apiClient = ApiClient()
    }
    
    func fetchTopStories(completion: @escaping ((_ data: [Item]?, _ error: Error?) -> Void)) {
        apiClient.fetch(withRequest: RequestFactory.topStoriesRequest(), completion: { (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let itemIds = data as? [Int] else {
                completion(nil, error)
                return
            }
            
            
        })
    }
}
