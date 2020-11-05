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
    
    public func startApp(onViewController hostViewController: UIViewController, app: HestiaApp, delegate: HestiaDelegate? = nil,
                         onSuccess: @escaping () -> (),
                         onFailure: @escaping (HestiaError) -> ()) {
        guard let data = (app.manifest?.base as? IOSAppManifest)?.data else {
            onFailure(HestiaError.invalidManifestData)
            return
        }
        
        getMiniAppIdToken(manifestData: data, onSuccess: { [weak self] idToken in
            let launcherData = AppLauncherData(idToken: idToken, extraConfig: app.manifest?.extra ?? [:])
            
            let launcher = self?.getAppLauncher(data: data, launcherData: launcherData, delegate: delegate)
            
            launcher?.create(className: data.mainClass, launcherData: launcherData, delegate: delegate, completion: { viewController in
                guard let viewController = viewController else { return }
                hostViewController.navigationController?.pushViewController(viewController, animated: true)
            })
        }) { error in
            onFailure(error)
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
        JanusManager.shared.exchangeToken(audience: manifestData.iamAudience) { (success, idToken, error) in
            if let token = idToken {
                onSuccess(token)
            } else if let _ = error {
                onFailure(.exchangeTokenFailed)
            }
        }
    }
    
}
