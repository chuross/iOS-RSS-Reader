//
//  RequestContext.swift
//  RssReader
//
//  Created by chuross on 2016/12/27.
//  Copyright © 2016年 chuross. All rights reserved.
//

import Foundation

protocol RequestContext {

    var baseUrl: URL { get }
}

public class DefaultRequestContext: RequestContext {

    var baseUrl: URL { return URL(string: "https://cloud.feedly.com/v3")! }
}
