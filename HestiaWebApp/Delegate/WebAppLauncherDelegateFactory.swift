//
//  WebAppLauncherDelegateFactory.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class WebAppLauncherDelegateFactory: AppLauncherDelegateFactory {
    
    required init() {
        
    }
    
    func create() -> AppLauncherDelegate {
        return WebAppLauncherDelegate()
    }
    
}
