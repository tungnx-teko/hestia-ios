//
//  AppLauncherDelegate.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import UIKit

public protocol AppLauncherDelegate {
    var appType: AppType { get }
    func startApp(application: UIApplication, app: HestiaApp) throws
}

public protocol AppLauncherDelegateFactory {
    init()
    func create() -> AppLauncherDelegate
}
