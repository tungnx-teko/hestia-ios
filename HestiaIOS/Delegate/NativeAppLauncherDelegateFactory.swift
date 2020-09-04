//
//  NativeAppLauncherDelegateFactory.swift
//  HestiaIOS
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import Hestia

class NativeAppLauncherDelegateFactory: AppLauncherDelegateFactory {
    
    required init() {
        
    }
    
    func create() -> AppLauncherDelegate {
        return NativeAppLauncherDelegate()
    }
    
}
