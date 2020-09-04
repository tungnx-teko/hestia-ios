//
//  IOSAppLauncherDelegate.swift
//  HestiaIOS
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Hestia
import Janus
import UIKit

class NativeAppLauncherDelegate: AppLauncherDelegate {
    
    var appType: AppType = .native
    
    func startApp(application: UIApplication, app: HestiaApp) throws {
        guard let data = (app.manifest?.base as? IOSAppManifest)?.data else {
            throw HestiaError.invalidManifestData
        }
        
        let launcher = getAppLauncher(manifestData: data)
        
        guard let root = self.getAppViewController(manifestData: data) else {
            throw HestiaError.invalidManifestData
        }
        
        getMiniAppIdToken(manifestData: data, onSuccess: { idToken in
            let launcherData = AppLauncherData(idToken: idToken, extraConfig: app.manifest?.extra ?? [:])
            launcher?.initApp(application: application, launcherData: launcherData)
            
            root.setUp(launcherData: launcherData)
            
            guard let rootViewController = root as? UIViewController else { return }
            application.topViewController()?.present(rootViewController, animated: true)
        }) { error in
            print(error)
        }
    }
    
    private func getAppLauncher(manifestData: IOSNativeManifestData) -> IOSAppLauncher? {
        guard let launcherClass = NSClassFromString(manifestData.initClass) as? IOSAppLauncher.Type else { return nil }
        return launcherClass.init()
    }
    
    private func getAppViewController(manifestData: IOSNativeManifestData) -> AppViewController? {
        guard let mainClass = NSClassFromString(manifestData.mainClass) as? AppViewController.Type else { return nil }
        return mainClass.init()
    }
    
}

extension NativeAppLauncherDelegate {
    
    func getMiniAppIdToken(manifestData: IOSNativeManifestData,
                           onSuccess: @escaping (String) -> (),
                           onFailure: @escaping (HestiaError) -> ()) {
        AuthManager.shared.exchangeToken(audience: manifestData.iamAudience) { (success, idToken, error) in
            if let token = idToken {
                onSuccess(token)
            } else if let _ = error {
                onFailure(.exchangeTokenFailed)
            }
        }
    }
    
}
