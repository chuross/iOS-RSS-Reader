//
//  EntryDetailScreenViewController.swift
//  RssReader
//
//  Created by chuross on 2017/06/28.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class EntryDetailScreenViewController : UIViewController {

    public var entry: Entry?
    private var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let webView = webView,
            let entryMeta = entry?.meta else { return }

        view.addSubview(webView)
        webView.load(URLRequest(url: entryMeta.url))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView?.frame = view.bounds
    }
}
