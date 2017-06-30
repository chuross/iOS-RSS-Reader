//
//  FeedMeta.swift
//  RssReader
//
//  Created by chuross on 2017/06/30.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation

class FeedMeta : ValueObject {

    let title: String
    let visualUrl: URL?

    init (title: String, visualUrl: URL?) {
        self.title = title
        self.visualUrl = visualUrl
    }

    public static func convert(json: [String: Any]) -> FeedMeta? {
        guard
            let title = json["title"] as? String
            else {
                return nil
        }

        let visualUrl = json["visualUrl"] as? String

        return FeedMeta(
            title: title,
            visualUrl: visualUrl != nil ? URL(string: visualUrl!)! : nil
        )
    }


    public static func ==(lhs: FeedMeta, rhs: FeedMeta) -> Bool {
        return lhs.title == rhs.title
            && lhs.visualUrl == rhs.visualUrl
    }
}
