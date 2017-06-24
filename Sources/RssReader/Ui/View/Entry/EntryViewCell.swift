//
//  EntryViewCell.swift
//  RssReader
//
//  Created by chuross on 2017/01/05.
//  Copyright © 2017年 chuross. All rights reserved.
//

import UIKit
import Kingfisher

class EntryViewCell: UITableViewCell {

    static let CELL_ID: String = "EntryViewCell"
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var title: UILabel!


    func setEntry(_ entry: Entry) {
        title.text = entry.meta?.title ?? "no title"
        thumbnailImage.kf.setImage(with: entry.meta?.thumbnailUrl)
    }
}
