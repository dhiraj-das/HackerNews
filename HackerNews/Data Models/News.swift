//
//  News.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

fileprivate struct Keys {
    static let id = "id"
    static let title = "title"
    static let text = "text"
    static let kids = "kids"
    static let url = "url"
    static let score = "score"
    static let by = "by"
    static let time = "time"
}

struct News {
    var id: Int
    var title: String
    var text: String?
    var commentIds: [Int] = []
    var score: Int?
    var by: String?
    var time: Date?
    var url: URL?
    
    
    init?(data: [String: Any]) {
        
        guard let _id = data[Keys.id] as? Int,
            let _title = data[Keys.title] as? String else { return nil }
        
        id = _id
        title = _title
        text = data[Keys.text] as? String
        commentIds = data[Keys.kids] as? [Int] ?? []
        score = data[Keys.score] as? Int
        by = data[Keys.by] as? String
        
        if let urlString = data[Keys.url] as? String {
            url = URL(string: urlString)
        }
        
        if let _time = data[Keys.time] as? Double {
            time = Date(timeIntervalSince1970: _time)
        }
    }
}

extension News {
    var numberOfComments: Int {
        return commentIds.count
    }
}

extension News: HomeTableViewCellRepresentable {
    var urlString: String {
        return url?.absoluteString ?? ""
    }
    
    var votes: Int {
        return score ?? 0
    }
    
    var commentCount: Int {
        return numberOfComments
    }
    
    var datetime: String {
        guard let _datetime = time else { return "" }
        return _datetime.timeAgo
    }
    
    var userName: String {
        return by ?? ""
    }
    
    var description: String {
        return text ?? ""
    }
}
