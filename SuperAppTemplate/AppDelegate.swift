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
        let factory = HestiaFactory()
        factory.urlString = "http://terra.dev.tekoapis.net"
        factory.application = application
        factory.clientId = "superappdemo:ios:appstore:0.0.1"
        
        hestia = try? factory.createService().base as? Hestia
        
        let config = JanusConfig(oauthUrl: "https://oauth.develop.tekoapis.net",
                                 identityUrl: "https://identity.develop.tekoapis.net",
                                 clientId: "6e6d495375e04b6aa6aa102a4abedb3a",
                                 scope: "openid profile read:permissions",
                                 googleAppId: "127353225225-o3cnd43i0bn55fcqm8qpj58a5ee6kq69.apps.googleusercontent.com",
                                 googleAppSecret: "kMBMp81a1qNpOsSqAL6dUPnm",
                                 facebookAppId: "2414049058898575",
                                 appleBundleId: "xxxx")
        
        Janus.shared.initialize(config: config)
        Janus.shared.application(for: application, didFinishLaunchingWithOptions: launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

extension UIApplication: HestiaApplication {}
