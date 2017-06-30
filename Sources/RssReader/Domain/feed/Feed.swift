//
//  Feed.swift
//  RssReader
//
//  Created by chuross on 2017/06/30.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation

class Feed : Entity {

    typealias ID = FeedId

    let id: FeedId
    let meta: FeedMeta?

    init(id: FeedId, meta: FeedMeta?) {
        self.id = id
        self.meta = meta
    }

    static func convert(json: [String: Any]) -> Feed? {
        guard let id = json["feedId"] as? String else { return nil }
        return Feed(
            id: FeedId(id),
            meta: FeedMeta.convert(json: json)
        )
    }
}
