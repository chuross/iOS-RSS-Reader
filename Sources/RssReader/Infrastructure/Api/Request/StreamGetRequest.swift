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

    typealias Response = MixContents

    var baseURL: URL { return context.baseUrl }
    var method: HTTPMethod { return .get }
    var path: String { return "/mixes/contents" }
    var parameters: Any {
        return [
            "stream_id": streamId
        ]
    }
    private let context: RequestContext
    private var streamId: String

    init(_ context:RequestContext, streamId: String) {
        self.context = context
        self.streamId = streamId
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        if let dictionary = object as? [String: Any] {
            return Mapper<Response>().map(JSON: dictionary)!
        } else {
            throw ResponseError.unexpectedObject(object)
        }
    }
}
