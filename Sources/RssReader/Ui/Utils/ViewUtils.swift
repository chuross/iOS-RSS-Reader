//
//  ViewUtils.swift
//  RssReader
//
//  Created by chuross on 2017/01/06.
//  Copyright © 2017年 chuross. All rights reserved.
//

import Foundation
import UIKit

final class ViewUtils {

    private init() {
    }

    public static func instantiateNib(_ nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    public static func instantiateView<T>(_ nibName: String) -> T {
        return instantiateNib(nibName).instantiate(withOwner: nil, options: nil)[0] as! T
    }
}
