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

class FeedScreenViewController : UIViewController, UISearchBarDelegate {

    var feedSearchBar: UISearchBar!
    @IBOutlet weak var feedCollection: UICollectionView!

    private let dataSource: FeedDataSource = FeedDataSource()
    private var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate = (UIApplication.shared.delegate) as! AppDelegate

        if let navigationController = delegate.navigationController {
            feedSearchBar = UISearchBar(frame: navigationController.navigationBar.bounds)
            feedSearchBar.placeholder = "ニュースサイト検索"
            feedSearchBar.keyboardType = UIKeyboardType.default
            feedSearchBar.delegate = self

            navigationItem.titleView = feedSearchBar
            navigationItem.titleView?.frame = feedSearchBar.frame
        }

        feedCollection.delegate = dataSource
        feedCollection.dataSource = dataSource
        feedCollection.register(ViewUtils.instantiateNib(FeedViewCell.CELL_ID), forCellWithReuseIdentifier: FeedViewCell.CELL_ID)

        dataSource.itemClickLitener = { feed -> Void in
            let viewController = EntriesScreenViewController()
            viewController.feed = feed
            delegate.navigationController?.pushViewController(viewController, animated: true)
        }

        search(query: "F1")
    }

    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            search(query: text)
            searchBar.resignFirstResponder()
        }
    }

    private func search(query: String) {
        let delegate = (UIApplication.shared.delegate) as! AppDelegate

        FeedRepository(container: delegate.container).findAllByKeyword(query: query)
            .subscribeOn(ConcurrentMainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] feeds -> Void in
                self?.dataSource.feeds.removeAll()
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
