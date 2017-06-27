//
//  EntriesScreenViewController.swift
//  RssReader
//
//  Created by chuross on 2017/06/28.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class EntriesScreenViewController : UIViewController {

    @IBOutlet weak var entryTable: UITableView!
    private let dataSource = EntryDataSource()
    private var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        entryTable.estimatedRowHeight = 100
        entryTable.rowHeight = UITableViewAutomaticDimension
        entryTable.dataSource = self.dataSource
        entryTable.delegate = self.dataSource
        entryTable.register(UINib(nibName: EntryViewCell.CELL_ID, bundle: nil), forCellReuseIdentifier: EntryViewCell.CELL_ID)

        let delegate = (UIApplication.shared.delegate) as! AppDelegate

        EntryRepository(container: delegate.container).findAllByFeedId(feedId: FeedId("feed/http://feeds.feedburner.com/Techcrunch"))
            .subscribe(onNext: { [weak self] entries -> Void in
                self?.dataSource.entries.append(contentsOf: entries)
                self?.entryTable.reloadData()
                }, onError: { error -> Void in
            })
            .addDisposableTo(disposeBag)

    }

    override func viewWillDisappear(_ animated: Bool) {
        disposeBag = DisposeBag()
    }

}
