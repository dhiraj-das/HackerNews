//
//  HomeDataProvider.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

class HomeDataProvider {
    
    var items: [Item] = []
    var limit = 30
    
    init(news: [Item]) {
        self.items = news
    }
}
