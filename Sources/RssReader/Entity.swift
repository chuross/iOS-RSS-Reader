//
//  Entity.swift
//  RssReader
//
//  Created by chuross on 2016/12/28.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation

protocol Entity {

    associatedtype ID: Identity

    var id: ID { get }

    func sameIdentityAs(other: Self) -> Bool
}

extension Entity {

    func sameIdentityAs(other: Self) -> Bool {
        return self.id == other.id
    }
}
