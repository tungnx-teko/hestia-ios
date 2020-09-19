//
//  AppType.swift
//  Hestia
//
//  Created by Tung Nguyen on 8/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public enum AppType: String {
    case reactNative = "react_native_android" // FIXME: only for test
    case native = "ios_native"
    case webView = "web"
}
