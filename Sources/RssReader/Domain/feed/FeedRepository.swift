//
//  FeedRepository.swift
//  RssReader
//
//  Created by chuross on 2017/06/30.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import Swinject
import RxSwift

class FeedRepository {

    private let api: FeedlyApi

    init(container: Container) {
        api = FeedlyApi(container.resolve(RequestContext.self)!)
    }

    func findAllByKeyword(query: String, count: Int = 20) -> Observable<[Feed]> {
        return api.searchFeed(query: query, count: count)
    }
}
