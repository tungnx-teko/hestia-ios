//
//  AppLauncherData.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class AppLauncherData {
    public var idToken: String?
    public var extraConfig: [String: Any] = [:]
    
    public init(idToken: String?, extraConfig: [String: Any]) {
        self.idToken = idToken
        self.extraConfig = extraConfig
    }
}
