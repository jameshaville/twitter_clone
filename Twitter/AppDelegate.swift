
//
//  AppDelegate.swift
//  Twitter
//
//  Created by James Haville on 13/01/2018.
//  Copyright © 2018 James Haville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let homeController = HomeController()

        window?.rootViewController = UINavigationController(rootViewController: homeController)

        return true
    }

}

