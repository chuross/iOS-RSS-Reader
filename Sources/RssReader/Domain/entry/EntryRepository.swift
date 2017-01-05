//
//  EntryRepository.swift
//  RssReader
//
//  Created by chuross on 2017/01/02.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import Swinject
import RxSwift

class EntryRepository {

    private let api: FeedlyApi

    init(container: Container) {
        api = FeedlyApi(container.resolve(RequestContext.self)!)
    }

    func findAllByFeedId(feedId: FeedId) -> Observable<[Entry]> {
        return api.getMixEntryContents(streamId: feedId.value)
            .map { mix -> [Entry] in mix.items }
    }
}
