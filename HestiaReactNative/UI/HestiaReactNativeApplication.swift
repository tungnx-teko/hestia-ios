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
    
    private(set) var rootViewController: HestiaReactNativeViewController? = nil
    
    public func createRootViewController(manifest: ReactNativeAppManifest, delegate: HestiaDelegate?) -> HestiaReactNativeViewController? {
        rootViewController = HestiaReactNativeViewController(manifest: manifest, delegate: delegate)
        return rootViewController
    }
}
