//
//  ViewController.swift
//  RssReader
//
//  Created by chuross on 2016/12/26.
//  Copyright © 2016年 chuross. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var entryTable: UITableView!
    private let dataSource = EntryDataSource()
    private var disposable: Disposable?

    override func viewDidLoad() {
        super.viewDidLoad()
        entryTable.dataSource = self.dataSource
        entryTable.delegate = self.dataSource
        entryTable.register(UINib(nibName: EntryViewCell.CELL_ID, bundle: nil), forCellReuseIdentifier: EntryViewCell.CELL_ID)

        let delegate = (UIApplication.shared.delegate) as! AppDelegate

        disposable = EntryRepository(container: delegate.container).findAllByFeedId(feedId: FeedId("feed/http://feeds.feedburner.com/Techcrunch"))
            .subscribe(onNext: { entries -> Void in
                self.dataSource.entries.append(contentsOf: entries)
                self.entryTable.reloadData()
            }, onError: { error -> Void in
            })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.disposable?.dispose()
    }

}

