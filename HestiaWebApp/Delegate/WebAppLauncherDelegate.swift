//
//  WebAppLauncherDelegate.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Hestia
import UIKit

public class WebAppLauncherDelegate: AppLauncherDelegate {
    
    public var appType: AppType = .webView
        
    public func startApp(onViewController hostViewController: UIViewController, app: HestiaApp, delegate: HestiaDelegate?, onSuccess: @escaping () -> (), onFailure: @escaping (HestiaError) -> ()) {
        guard let manifest = app.manifest?.base as? WebAppManifest else {
            onFailure(.invalidManifestData)
            return
        }
        
        DispatchQueue.main.async {
            let hestiaWebVC = HestiaWebViewController(manifest: manifest, delegate: delegate)
            let navigation = UINavigationController(rootViewController: hestiaWebVC)
            hostViewController.present(navigation, animated: true, completion: nil)
            onSuccess()
        }
    }
    
}
