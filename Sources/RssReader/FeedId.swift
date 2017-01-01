//
//  FeedId.swift
//  RssReader
//
//  Created by chuross on 2017/01/02.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation

class FeedId: Identity {

    typealias Value = String

    let value: Value


    public init(_ value: String) {
        self.value = value
    }

}
