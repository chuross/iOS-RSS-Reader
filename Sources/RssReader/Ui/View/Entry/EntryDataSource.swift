//
//  EntryDataSource.swift
//  RssReader
//
//  Created by chuross on 2017/01/06.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import UIKit

class EntryDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var entries: [Entry] = []


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryViewCell.CELL_ID, for: indexPath) as! EntryViewCell

        cell.setEntry(entries[indexPath.row])

        return cell
    }

}
