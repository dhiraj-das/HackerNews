//
//  HomeDataProvider.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

class HomeDataProvider {
    
    var items: [News] = []
    var limit = 30
    
    init(news: [News]) {
        self.items = news
    }
}
