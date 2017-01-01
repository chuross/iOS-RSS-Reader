//
//  StreamGetRequest.swift
//  RssReader
//
//  Created by chuross on 2016/12/27.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation
import APIKit

struct StreamGetRequest: Request {

    var baseURL: URL { return context.baseUrl }
    var method: HTTPMethod { return .get }
    var path: String { return "/mixes/contents" }
    var parameters: Any? {
        return [
            "streamId": streamId
        ]
    }
    private let context: RequestContext
    private let streamId: String


    init(_ context:RequestContext, streamId: String) {
        self.context = context
        self.streamId = streamId
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> MixEntryContents {
        if let dictionary = object as? [String: Any] {
            return MixEntryContents.convert(json: dictionary)
        } else {
            throw ResponseError.unexpectedObject(object)
        }
    }
}
