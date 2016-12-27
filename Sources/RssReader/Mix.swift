//
//  Mix.swift
//  RssReader
//
//  Created by chuross on 2016/12/27.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation
import ObjectMapper

class Mix: Mappable {

    var id: String?
    var title: String?
    var items: [Entry]

    required init?(map: Map) {
        items = (try? map.value("items")) ?? []
    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        items <- map["items"]
    }
}
