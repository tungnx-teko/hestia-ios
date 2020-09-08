//
//  IOSAppLauncher.swift
//  HestiaIOS
//
//  Created by Tung Nguyen on 9/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia

public protocol IOSAppLauncherProtocol {
    var viewController: UIViewController? { get }
    var hestiaDelegate: HestiaDelegate? { get }
    
    init(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate?)
}

open class IOSAppLauncher: IOSAppLauncherProtocol {
    public private(set) var hestiaDelegate: HestiaDelegate?
    public private(set) var viewController: UIViewController?
    
    required public init(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate? = nil) {
        self.hestiaDelegate = delegate
        self.viewController = getAppViewController(className: className) as? UIViewController
    }
    
    private func getAppViewController(className: String) -> AppViewController? {
        guard let mainClass = NSClassFromString(className) as? AppViewController.Type else { return nil }
        return mainClass.init()
    }
    
}
