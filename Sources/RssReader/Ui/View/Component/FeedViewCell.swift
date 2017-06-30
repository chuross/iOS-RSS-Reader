//
//  FeedViewCell.swift
//  RssReader
//
//  Created by chuross on 2017/06/30.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class FeedViewCell : UICollectionViewCell {

    static let CELL_ID: String = "FeedViewCell"

    @IBOutlet weak var visualImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!

    func setFeed(_ feed: Feed) {
        visualImage.kf.setImage(with: feed.meta?.visualUrl)
        titleText.text = feed.meta?.title
    }
}
