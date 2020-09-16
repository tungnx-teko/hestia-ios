//
//  AppDelegate.swift
//  SuperAppTemplate
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia
import TekCoreService
import Janus
import FBSDKLoginKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hestia: Hestia?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let hestiaConfig = HestiaConfig(url: "http://terra.dev.tekoapis.net",
                                        clientId: "superappdemo:ios:appstore:0.0.1")
        
        Hestia.shared.initialize(config: hestiaConfig, application: application as HestiaApplication)
        
        let config: [String : Any] = [
            "oauthUrl":"https://oauth.develop.tekoapis.net",
            "identityUrl":"https://identity.develop.tekoapis.net",
            "clientId":"6e6d495375e04b6aa6aa102a4abedb3a",
            "scope":"openid profile read:permissions",
            "googleAppId":"563692749265-7d1vdgcj20ltdb61torp9n76mmsi2907.apps.googleusercontent.com",
            "facebookAppId":"2414049058898575"
        ]
        
        Janus.shared.initialize(config: config, for: application, launchOptions: launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return Janus.shared.application(app, open: url, options: options)
    }

}

extension UIApplication: HestiaApplication {}
