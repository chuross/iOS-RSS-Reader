//
//  MixEntryContents.swift
//  RssReader
//
//  Created by chuross on 2016/12/28.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation

class MixEntryContents: ValueObject {

    let title: String
    let items: [Entry]


    init(title: String, items: [Entry]) {
        self.title = title
        self.items = items
    }

    public static func ==(lhs: MixEntryContents, rhs: MixEntryContents) -> Bool {
        return lhs.title == rhs.title
    }

    static func convert(json: [String: Any]) -> MixEntryContents {
        let items: [Entry] = (json["items"] as? [[String: Any]])?
            .map { item -> Entry? in return Entry.convert(json: item) }
            .filter { item -> Bool in item != nil }
            .map { item -> Entry in item! }
            ?? []

        return MixEntryContents(
            title: json["title"] as? String ?? "no title",
            items: items
        )
    }
}
