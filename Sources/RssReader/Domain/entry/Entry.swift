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
    let meta: EntryMeta?

    init(id: EntryId, meta: EntryMeta?) {
        self.id = id
        self.meta = meta
    }

    static func convert(json: [String: Any]) -> Entry? {
        guard let id = json["id"] as? String else { return nil }
        return Entry(
            id: EntryId(id),
            meta: EntryMeta.convert(json: json)
        )
    }
}
