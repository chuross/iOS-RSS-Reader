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

    func getMixContents(streamId: String) -> Observable<MixContents> {
        return Session.rx_send(StreamGetRequest(context, streamId: streamId))
    }
}
