//
//  ReactNativeLauncherDelegate.swift
//  HestiaReactNative
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia

public class ReactNativeAppLauncherDelegate: AppLauncherDelegate {
    
    private let clientId: String
    
    public var appType: AppType = .reactNative
    
    init(clientId: String) {
        self.clientId = clientId
    }
        
    public func startApp(onViewController hostViewController: UIViewController, app: HestiaApp, delegate: HestiaDelegate?, onSuccess: @escaping () -> (), onFailure: @escaping (HestiaError) -> ()) {
        guard let _ = app.manifest?.base as? ReactNativeAppManifest else {
            onFailure(.invalidManifestData)
            return
        }
        
        DispatchQueue.main.async {
            let rootVC = HestiaReactNativeApplication.shared.createRootViewController(clientId: self.clientId, app: app, delegate: delegate)
            if let rootVC = rootVC {
                let navigation = UINavigationController(rootViewController: rootVC)
                hostViewController.present(navigation, animated: true, completion: nil)
                onSuccess()
            } else {
                // TODO: error
            }
        }
    }
    
}
