//
//  Item.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

struct Item {
    var id: Int
    var time: Date
    var text: String
    var kids: [Int]
    var url: String
    var score: Int
    var title: String
}
