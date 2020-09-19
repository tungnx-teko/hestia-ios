//
//  ReactNativeLauncherDelegate.swift
//  HestiaReactNative
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Hestia

public class ReactNativeAppLauncherDelegate: AppLauncherDelegate {
    
    private let clientId: String
    
    public var appType: AppType = .reactNative
    
    init(clientId: String) {
        self.clientId = clientId
    }
        
    public func startApp(application: HestiaApplication, app: HestiaApp, delegate: HestiaDelegate?, onSuccess: @escaping () -> (), onFailure: @escaping (HestiaError) -> ()) {
        guard let manifest = app.manifest?.base as? ReactNativeAppManifest else {
            onFailure(.invalidManifestData)
            return
        }
        
        // TODO: download bundle
        BundleDownloader(clientId: clientId).resolveBundleFromManifest(app: app, completion: { url, error in
            
        })
    }
    
}