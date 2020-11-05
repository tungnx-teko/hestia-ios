//
//  AppDelegate.swift
//  ReactNativeExample
//
//  Created by Le Vu Huy on 11/5/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import React

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        guard let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") else {
            return true
        }

        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "RNMain",
            initialProperties: nil,
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView

        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()

        return true
    }

}

