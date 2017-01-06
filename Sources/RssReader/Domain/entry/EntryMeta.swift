//
//  EntryMeta.swift
//  RssReader
//
//  Created by chuross on 2017/01/01.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation

class EntryMeta: ValueObject {

    let title: String
    let url: URL
    let thumbnailUrl: URL?


    init(title: String, url: URL, thumbnailUrl: URL?) {
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }

    public static func convert(json: [String: Any]) -> EntryMeta? {
        guard
            let title = json["title"] as? String,
            let url = json["originId"] as? String
        else {
            return nil
        }
        let thumbnailUrl = (json["thumbnail"] as? [[String: Any]])?.first?["url"] as? String
        return EntryMeta(
            title: title,
            url: URL(string: url)!,
            thumbnailUrl: thumbnailUrl != nil ? URL(string: thumbnailUrl!)! : nil
        )
    }

    public static func ==(lhs: EntryMeta, rhs: EntryMeta) -> Bool {
        return lhs.title == rhs.title
            && lhs.url == rhs.url
            && lhs.thumbnailUrl == rhs.thumbnailUrl
    }
}
