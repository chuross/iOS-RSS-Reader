//
//  FeedSearchRequest.swift
//  RssReader
//
//  Created by chuross on 2017/06/30.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import APIKit

class FeedSearchRequest : Request {

    var baseURL: URL { return context.baseUrl }
    var method: HTTPMethod { return .get }
    var path: String { return "/search/feeds" }
    var parameters: Any? {
        return [
            "query": query,
            "count": count,
            "locale": "ja"
        ]
    }
    private let context: RequestContext
    private let query: String
    private let count: Int

    init(_ context:RequestContext, query: String, count: Int = 20) {
        self.context = context
        self.query = query
        self.count = count
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Feed] {
        if let dictionary = object as? [String: Any] {
            return (dictionary["results"] as? [[String: Any]])?
                .map({ item -> Feed? in return Feed.convert(json: item) })
                .filter({ feed -> Bool in feed != nil })
                .map({ feed -> Feed in feed! })
                ?? []
        } else {
            throw ResponseError.unexpectedObject(object)
        }
    }

}
