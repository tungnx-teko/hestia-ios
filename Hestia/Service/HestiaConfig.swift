//
//  HestiaConfig.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public struct HestiaConfig {
    public var url: String
    public var clientId: String
    
    public init(url: String, clientId: String) {
        self.url = url
        self.clientId = clientId
    }
    
}
