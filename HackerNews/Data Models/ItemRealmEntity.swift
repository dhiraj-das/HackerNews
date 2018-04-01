//
//  ItemRealmEntity.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/2/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class ItemRealmEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String?
    @objc dynamic var text: String?
    @objc dynamic var by: String?
    @objc dynamic var time: Date?
    @objc dynamic var urlString: String?
    @objc dynamic var type: String?
    let score = RealmOptional<Int>()
    let commentIds = List<Int>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    init(item: Item) {
        super.init()
        id = item.id
        by = item.by
        commentIds.append(objectsIn: item.commentIds)
        score.value = item.score
        text = item.text
        time = item.time
        title = item.title
        type = item.type
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
