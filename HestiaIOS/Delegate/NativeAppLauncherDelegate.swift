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
    
    func startApp(application: HestiaApplication, app: HestiaApp, delegate: HestiaDelegate?) throws {
        guard let data = (app.manifest?.base as? IOSAppManifest)?.data else {
            throw HestiaError.invalidManifestData
        }
        
        getMiniAppIdToken(manifestData: data, onSuccess: { [weak self] idToken in
            let launcherData = AppLauncherData(idToken: idToken, extraConfig: app.manifest?.extra ?? [:])
            
            let launcher = self?.getAppLauncher(data: data, launcherData: launcherData, delegate: delegate)
            
            launcher?.viewController.map { application.open($0) }
        }) { error in
            print(error)
        }
    }
    
    private func getAppLauncher(data: IOSNativeManifestData, launcherData: AppLauncherData, delegate: HestiaDelegate?) -> IOSAppLauncher? {
        guard let launcherClass = NSClassFromString(data.initClass) as? IOSAppLauncher.Type else { return nil }
        return launcherClass.init(className: data.mainClass, launcherData: launcherData, delegate: delegate)
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
