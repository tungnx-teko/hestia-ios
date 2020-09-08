//
//  WebAppLauncherDelegate.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

public class WebAppLauncherDelegate: AppLauncherDelegate {
    
    public var appType: AppType = .webView
    
    public func startApp(application: HestiaApplication, app: HestiaApp, delegate: HestiaDelegate?) throws {
        guard let manifest = app.manifest?.base as? WebAppManifest else {
            throw HestiaError.invalidManifestData
        }
        
        DispatchQueue.main.async {
            let hestiaWebVC = HestiaWebViewController(manifest: manifest, delegate: delegate)
            let navigation = UINavigationController(rootViewController: hestiaWebVC)
            application.open(navigation)
        }
    }
    
}
