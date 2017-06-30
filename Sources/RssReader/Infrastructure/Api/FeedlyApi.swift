//
//  FeedlyApi.swift
//  RssReader
//
//  Created by chuross on 2016/12/27.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

class FeedlyApi {

    let context: RequestContext
    

    init(_ context: RequestContext) {
        self.context = context
    }

    func getMixEntryContents(streamId: String) -> Observable<MixEntryContents> {
        return Session.rx_send(StreamGetRequest(context, streamId: streamId))
    }

    func searchFeed(query: String, count: Int) -> Observable<[Feed]> {
        return Session.rx_send(FeedSearchRequest(context, query: query, count: count))
    }
}
