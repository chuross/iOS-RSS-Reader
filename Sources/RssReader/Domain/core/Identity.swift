//
//  Identity.swift
//  RssReader
//
//  Created by chuross on 2016/12/28.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation

protocol Identity : ValueObject {

    associatedtype Value: Equatable, Hashable

    var value: Value { get }
}

extension Identity {

    var hashValue: Int { return value.hashValue }
}

func ==<T: Identity>(lhs: T, rhs: T) -> Bool {
    return lhs.value == rhs.value
}
