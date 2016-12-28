//
//  EntryId.swift
//  RssReader
//
//  Created by chuross on 2016/12/28.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation

struct EntryId: Identity {

    typealias Value = String

    let value: Value


    public init(_ value: String) {
        self.value = value
    }
}
