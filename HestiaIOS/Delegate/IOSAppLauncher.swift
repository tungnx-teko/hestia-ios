//
//  IOSAppLauncher.swift
//  HestiaIOS
//
//  Created by Tung Nguyen on 9/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia

public protocol IOSAppLauncher {
    init()
    func initApp(application: UIApplication, launcherData: AppLauncherData)
}
