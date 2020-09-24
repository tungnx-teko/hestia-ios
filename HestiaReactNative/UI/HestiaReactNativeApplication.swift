//
//  ReactNativeApplication.swift
//  HestiaReactNative
//
//  Created by batu on 9/19/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Hestia

class HestiaReactNativeApplication {
    public static let shared = HestiaReactNativeApplication()
    
    private(set) var rootViewController: RootViewController? = nil
    
    public func createRootViewController(clientId: String, app: HestiaApp, delegate: HestiaDelegate?) -> RootViewController? {
        rootViewController = RootViewController(clientId: clientId, app: app, delegate: delegate)
        return rootViewController
    }
}
