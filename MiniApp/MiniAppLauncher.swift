//
//  MiniAppLauncher.swift
//  MiniApp
//
//  Created by Tung Nguyen on 9/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import HestiaIOS
import Hestia

class MiniAppLauncher: IOSAppLauncher, ViewControllerDelegate {

    required init(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate? = nil) {
        super.init(className: className, launcherData: launcherData, delegate: delegate)
        (viewController as? ViewController)?.delegate = self
    }
    
    func onSuccess() {
        hestiaDelegate?.callback(data: ["result": true])
    }
    
    func onFailure() {
        hestiaDelegate?.callback(data: ["result": false])
    }
    
}
