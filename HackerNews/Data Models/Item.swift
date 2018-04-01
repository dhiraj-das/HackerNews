//
//  Item.swift
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
    static let type = "type"
}

struct Item {
    var id: Int
    var title: String?
    var text: String?
    var commentIds: [Int] = []
    var score: Int?
    var by: String?
    var time: Date?
    var url: URL?
    var type: String?
    
    init?(data: [String: Any]) {
        
        guard let _id = data[Keys.id] as? Int else { return nil }
        
        id = _id
        title = data[Keys.title] as? String
        text = data[Keys.text] as? String
        commentIds = data[Keys.kids] as? [Int] ?? []
        score = data[Keys.score] as? Int
        by = data[Keys.by] as? String
        type = data[Keys.type] as? String
        
        if let urlString = data[Keys.url] as? String {
            url = URL(string: urlString)
        }
        
        if let _time = data[Keys.time] as? Double {
            time = Date(timeIntervalSince1970: _time)
        }
    }
    
    init(realmEntity: ItemRealmEntity) {
        id = realmEntity.id
        title = realmEntity.title
        text = realmEntity.text
        score = realmEntity.score.value
        by = realmEntity.by
        type = realmEntity.type
        time = realmEntity.time
        commentIds = realmEntity.commentIds.map({ $0 })
        
        if let _urlString = realmEntity.urlString {
            url = URL(string: _urlString)
        }
    }
}

extension Item {
    var numberOfComments: Int {
        return commentIds.count
    }
}

extension Item: HomeTableViewCellRepresentable {
    
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
    
    var description: NSAttributedString {
        return text?.convertHtml() ?? NSAttributedString()
    }
}

extension Item: CommentTableViewCellRepresentable {}
