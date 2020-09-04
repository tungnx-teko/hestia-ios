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

class MiniAppLauncher: IOSAppLauncher {
    
    required init() {
        
    }
    
    func initApp(application: UIApplication, launcherData: AppLauncherData) {
        MiniAppSdk.shared.token = launcherData.idToken
    }
    
}
