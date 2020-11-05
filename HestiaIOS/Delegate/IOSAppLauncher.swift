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
    var hestiaDelegate: HestiaDelegate? { get }
    
    init(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate?)
    func create(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate?, completion: @escaping (UIViewController?) -> ())
}

open class IOSAppLauncher: IOSAppLauncherProtocol {
    public private(set) var hestiaDelegate: HestiaDelegate?
    
    required public init(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate? = nil) {
        self.hestiaDelegate = delegate
    }
    
    open func create(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate? = nil, completion: @escaping (UIViewController?) -> ()) {
        guard let mainClass = NSClassFromString(className) as? UIViewController.Type else {
            completion(nil)
            return
        }
        completion(mainClass.init())
    }
    
}
