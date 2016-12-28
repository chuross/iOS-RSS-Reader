//
//  Entry.swift
//  RssReader
//
//  Created by chuross on 2016/12/28.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation

class Entry: Entity {

    typealias ID = EntryId

    let id: EntryId


    init(id: EntryId) {
        self.id = id
    }

    static func convert(json: [String: Any]) -> Entry? {
        guard let id = json["id"], id is String else { return nil }
        return Entry(id: EntryId(id as! String))
    }
}
