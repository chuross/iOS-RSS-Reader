//
//  AppDelegate.swift
//  RssReader
//
//  Created by chuross on 2016/12/26.
//  Copyright © 2016年 chuross. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let container: Container = Container() { container in
        container.register(RequestContext.self) {_ in return DefaultRequestContext() }
            .inObjectScope(.container)
    }
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = EntriesScreenViewController()
        self.window?.makeKeyAndVisible()

        return true
    }

}

