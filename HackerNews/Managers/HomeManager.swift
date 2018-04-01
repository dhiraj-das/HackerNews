//
//  HomeManager.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

class HomeManager {
    
    let service = HomeService()
    
    func fetchTopStories(offsetBy: Int, completion: @escaping ((_ data: [Item]?, _ error: Error?) -> Void)) {
        service.fetchTopStories(lastItem: offsetBy, completion: completion)
    }
    
    func fetchComments(kids: [Int], completion: @escaping ((_ data: [Item]?, _ error: Error?) -> Void)) {
        service.fetchComments(ids: kids, completion: completion)
    }
}
