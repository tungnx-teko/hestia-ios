//
//  ReactNativeLauncherDelegateFactory.swift
//  HestiaReactNative
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Hestia

public class ReactNativeAppLauncherDelegateFactory: AppLauncherDelegateFactory, NeedClientId {
    
    private var clientId: String!
    
    required public init() {
        
    }
    
    public func withClientId(clientId: String) {
        self.clientId = clientId
    }
    
    public func create() -> AppLauncherDelegate {
        return ReactNativeAppLauncherDelegate(clientId: clientId)
    }
    
}
