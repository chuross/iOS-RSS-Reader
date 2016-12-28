//
//  StreamGetRequest.swift
//  RssReader
//
//  Created by chuross on 2016/12/27.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation
import APIKit
import ObjectMapper

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

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [String: Any] {
        if let dictionary = object as? [String: Any] {
            return dictionary
        } else {
            throw ResponseError.unexpectedObject(object)
        }
    }
}
