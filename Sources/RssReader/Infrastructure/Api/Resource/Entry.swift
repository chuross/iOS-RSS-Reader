//
//  Entry.swift
//  RssReader
//
//  Created by chuross on 2016/12/27.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation
import ObjectMapper

class Entry: Mappable {

    var id: String?
    var title: String?
    var url: String?
    var thumbnailUrl: URL?
    var publishedAt: Date?
    

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        url <- map["originId"]
        thumbnailUrl <- map["thumbnail.0.url"]
        publishedAt <- (map["published"], DateTransform())
    }
}
