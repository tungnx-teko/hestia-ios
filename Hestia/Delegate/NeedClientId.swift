//
//  NeedClientId.swift
//  HestiaReactNative
//
//  Created by batu on 9/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol NeedClientId {
    func withClientId(clientId: String) -> Void
}

