//
//  LocalDatabaseManager.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/2/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import RealmSwift

class LocalDatabaseManager {
    
    static let shared = LocalDatabaseManager()
    
    var realm: Realm!
    
    private init() {
        do {
            realm = try Realm(configuration: .defaultConfiguration)
        } catch let error {
            debugPrint(error)
        }
    }
    
    func fetchTopStories() -> [Item] {
        let predicate = NSPredicate(format: "type != %@", "comment")
        let topStories = realm.objects(ItemRealmEntity.self).filter(predicate)
        return topStories.map {Item(realmEntity: $0)}
    }
    
    func storeTopStories(items: [Item]) {
        let entities = items.map {ItemRealmEntity(item: $0)}
        realm.beginWrite()
        realm.add(entities)
        try? realm.commitWrite()
    }
}
