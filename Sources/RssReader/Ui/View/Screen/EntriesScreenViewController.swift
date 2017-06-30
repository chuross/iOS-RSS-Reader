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
    var feed: Feed? = nil
    private let dataSource = EntryDataSource()
    private var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "記事一覧"

        entryTable.estimatedRowHeight = 100
        entryTable.rowHeight = UITableViewAutomaticDimension
        entryTable.dataSource = dataSource
        entryTable.delegate = dataSource
        entryTable.register(ViewUtils.instantiateNib(EntryViewCell.CELL_ID), forCellReuseIdentifier: EntryViewCell.CELL_ID)

        dataSource.itemClickLitener = { entry in
            let viewController = EntryDetailScreenViewController()
            viewController.entry = entry
            
            AppDelegate.application().navigationController?.pushViewController(viewController, animated: true)
        }

        let delegate = (UIApplication.shared.delegate) as! AppDelegate

        if let feed = feed {
            EntryRepository(container: delegate.container).findAllByFeedId(feedId: feed.id)
                .subscribeOn(ConcurrentMainScheduler.instance)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { [weak self] entries -> Void in
                    self?.dataSource.entries.append(contentsOf: entries)
                    self?.entryTable.reloadData()
                    }, onError: { error -> Void in
                })
                .addDisposableTo(disposeBag)

        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }

}
