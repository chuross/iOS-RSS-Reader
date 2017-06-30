//
//  FeedScreenViewController.swift
//  RssReader
//
//  Created by chuross on 2017/06/30.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class FeedScreenViewController : UIViewController {

    @IBOutlet weak var feedSearchBar: UISearchBar!
    @IBOutlet weak var feedCollection: UICollectionView!

    private let dataSource: FeedDataSource = FeedDataSource()
    private var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "フィード一覧"

        feedSearchBar.rx.searchButtonClicked
            .subscribe(onNext: { _ in
                //TODO
            })
            .addDisposableTo(disposeBag)

        feedCollection.delegate = dataSource
        feedCollection.dataSource = dataSource
        feedCollection.register(ViewUtils.instantiateNib(FeedViewCell.CELL_ID), forCellWithReuseIdentifier: FeedViewCell.CELL_ID)

        let delegate = (UIApplication.shared.delegate) as! AppDelegate

        dataSource.itemClickLitener = { feed -> Void in
            let viewController = EntriesScreenViewController()
            viewController.feed = feed
            delegate.navigationController?.pushViewController(viewController, animated: true)
        }

        FeedRepository(container: delegate.container).findAllByKeyword(query: "F1")
            .subscribeOn(ConcurrentMainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] feeds -> Void in
                self?.dataSource.feeds.append(contentsOf: feeds)
                self?.feedCollection.reloadData()
            }, onError: { error in
                print(error)
            })
            .addDisposableTo(disposeBag)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }
}
