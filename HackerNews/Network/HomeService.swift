//
//  HomeService.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation
import Firebase

fileprivate struct Endpoints {
    static let topStories = "https://hacker-news.firebaseio.com/v0/topstories.json"
}

class HomeService {
    
    private var apiClient: ApiClient!
    
    init() {
        apiClient = ApiClient()
    }
    
    func fetchTopStories(lastItem: Int? = nil,
                         limit: Int = 30,
                         completion: @escaping ((_ data: [News]?, _ error: Error?) -> Void)) {
        let concurrentQueue = DispatchQueue(label: "top_stories",
                                            qos: .background,
                                            attributes: .concurrent,
                                            autoreleaseFrequency: .inherit,
                                            target: nil)
        let dispatchGroup = DispatchGroup()
        
        apiClient.fetch(withRequest: RequestFactory.requestTopStories(), completion: { (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let itemIds = data as? [Int] else {
                completion(nil, error)
                return
            }
            
            var topStories: [News] = []
            let lastFetchedItemIndex = lastItem == nil ? itemIds.startIndex : itemIds.index(lastItem!, offsetBy: 1)
            let endIndex = itemIds.index(lastFetchedItemIndex, offsetBy: 30)
            let slicedItemIds = itemIds[lastFetchedItemIndex..<endIndex]
            
            concurrentQueue.async {
                for itemId in slicedItemIds {
                    dispatchGroup.enter()
                    self.fetchNews(withId: itemId, completion: { (item, error) in
                        guard error == nil else {
                            dispatchGroup.leave()
                            return
                        }
                        guard let _item = item else {
                            dispatchGroup.leave()
                            return
                        }
                        topStories.append(_item)
                        dispatchGroup.leave()
                    })
                }
                dispatchGroup.notify(queue: .main, execute: {
                    completion(topStories, nil)
                })
            }
        })
    }
    
    func fetchNews(withId id: Int, completion: @escaping ((_ data: News?, _ error: Error?) -> Void)) {
        apiClient.fetch(withRequest: RequestFactory.requestItem(withId: id)) { (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let item = data as? [String: Any] else {
                completion(nil, error)
                return
            }
            completion(News(data: item), error)
        }
    }
}
